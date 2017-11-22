<?php
App::import('Vendor', 'nusoap', array('file' => 'nusoap/nusoap.php'));
class MasivoProductosShell extends AppShell
{
	public $pxp			= 300;
	public $endpoint	= 'http://200.29.13.186:8091/WebService1.asmx?WSDL';
	public $uses		= array('Carga');
	public $auto		= true;
	private $carga_id	= null;

	public function main()
	{
		set_time_limit(0);
		$this->hr();

		/**
		 * Verifica que no se esté ejecutando una carga masiva anterior
		 */
		$anterior		= $this->Carga->find('first', array(
			'fields'		=> array('Carga.id'),
			'conditions'	=> array('Carga.ejecucion' => true),
			'order'			=> array('Carga.id' => 'DESC')
		));
		if ( ! empty($anterior) )
		{
			$this->error('Error: Carga masiva en ejecución.');
		}

		/**
		 * Ingresa los datos de la carga actual
		 */
		$this->Carga->create();
		$this->Carga->save(array(
			'identificador'		=> sprintf('%s-%d%02d%02d-%02d%02d%02d', ($this->auto ? 'AUTO' : 'MANUAL')),
			'ejecutando'		=> true,
			'manual'			=> !! $this->auto
		));
		$this->carga_id		= $this->Carga->id;

		/**
		 * Instancia el cliente SOAP e intenta la conexión con el WS
		 */
		$ws = new nusoap_client($this->endpoint, 'wsdl');
		$ws->setGlobalDebugLevel(0);
		$err = $ws->getError();

		if ( $ws->getError() )
		{
			$this->error('Error conexión WS: ' . $ws->getError());
		}

		/**
		 * Obtiene la cantidad de paginas de Productos
		 */

		// Buscamos la cantidad de paginas
		$param = array('Registros' => $this->pxp, 'Pagina' => 1, 'TipoResultado' => 1);
		$result = $ws->call('Ws_ListarProductosXpagina', array('parameters' => $param), '', '', false, true);

		if(!$ws->fault && !$ws->getError()){
			if(!empty($result['Ws_ListarProductosXpaginaResult']['diffgram'])){
				$cantidadPaginas = $result['Ws_ListarProductosXpaginaResult']['diffgram']['NewDataSet']['Table1']['TotalPaginas'];
				$this->out('Cantidad de paginas: ' . $cantidadPaginas);
				$this->Producto->query('TRUNCATE TABLE _temporal_productos');

				if(count($masivas) == 0){
				  // Carga automativa
				  $this->Producto->query('INSERT INTO sitio_masivas (asunto, ejecutada, en_proceso,fecha_inicio, created) VALUES ("carga masiva productos", 0,1, NOW(),NOW());');

				}else{
				  $this->Producto->query('UPDATE sitio_masivas SET en_proceso = 1 WHERE id = ' . $masivas['Masiva']['id']);
				}

				for($i=1; $i <= $cantidadPaginas; $i++){
				// for($i=55; $i <= 55; $i++){
					$this->out(sprintf('PAGINA WS %d', $i));

					$param2 = array('Registros' => $this->pxp, 'Pagina' => $i, 'TipoResultado' => 0);
					$result2 = $ws->call('Ws_ListarProductosXpagina', array('parameters' => $param2), '', '', false, true);

					if(!$ws->fault && !$ws->getError()){
						if(!empty($result2['Ws_ListarProductosXpaginaResult']['diffgram'])){
							foreach ($result2['Ws_ListarProductosXpaginaResult']['diffgram']['NewDataSet']['Table'] as $producto) {
								$sku			= trim($producto['CODIGO']);
								$nombre		 = trim(ucwords(mb_strtolower($producto['DESCRIPCION'])));
								$slugdescripcion = str_replace('/', '-', $nombre.' '.$sku);

								$slug = strtolower(Inflector::slug($slugdescripcion, '-'));

								$this->Producto->query(sprintf("INSERT INTO _temporal_productos (
									codigo
									, descripcion
									, stock
									, precio_publico
									, dscto_publico
									, preciofinal_publico
									, precio_mayorista
									, dscto_mayorista
									, preciofinal_mayorista
									, categoria
									, subcategoria
									, subsubcategoria
									, marca
									, activo
									, ficha
									, id_ws
									, descrip
									, stock_fi
									, super_fam
									, familia
									, categorias
									, stock_seguridad
									, apernadura
									, aro
									, ancho_llanta
									, ancho
									, perfil
									, fecha_compra
									, oferta_mayorista
									, oferta_publico
									, stock_compra
									, slug
									, fecha_ultima_modificacion
									)
									 VALUES ('%s','%s',%d ,%d ,%d ,%d ,%d ,%d ,%d ,'%s','%s','%s','%s',%d ,'%s',%d ,'%s',%d ,'%s','%s', %d , %d , '%s',%d ,%d ,%d ,%d ,'%s',%d ,%d ,%d, '%s', '%s' );",
									empty($producto['CODIGO']) || is_array($producto['CODIGO']) ? '' : $producto['CODIGO']
								   ,empty($producto['DESCRIPCION']) || is_array($producto['DESCRIPCION']) ? '' : $producto['DESCRIPCION']
								   ,empty($producto['STOCK']) || is_array($producto['STOCK']) ? '' : $producto['STOCK']
								   ,empty($producto['PRECIO_PUBLICO']) || is_array($producto['PRECIO_PUBLICO']) ? '' : $producto['PRECIO_PUBLICO']
								   ,empty($producto['DSCTO_PUBLICO']) || is_array($producto['DSCTO_PUBLICO']) ? '' : $producto['DSCTO_PUBLICO']
								   ,empty($producto['PRECIOFINAL_PUBLICO']) || is_array($producto['PRECIOFINAL_PUBLICO']) ? '' : $producto['PRECIOFINAL_PUBLICO']
								   ,empty($producto['PRECIO_MAYORISTA']) || is_array($producto['PRECIO_MAYORISTA']) ? '' : $producto['PRECIO_MAYORISTA']
								   ,empty($producto['DSCTO_MAYORISTA']) || is_array($producto['DSCTO_MAYORISTA']) ? '' : $producto['DSCTO_MAYORISTA']
								   ,empty($producto['PRECIOFINAL_MAYORISTA']) || is_array($producto['PRECIOFINAL_MAYORISTA']) ? '' : $producto['PRECIOFINAL_MAYORISTA']
								   ,empty($producto['CATEGORIA']) || is_array($producto['CATEGORIA']) ? '' : $producto['CATEGORIA']
								   ,empty($producto['SUBCATEGORIA']) || is_array($producto['SUBCATEGORIA'])  ? '' : $producto['SUBCATEGORIA']
								   ,empty($producto['SUBSUBCATEGORIA']) || is_array($producto['SUBSUBCATEGORIA'])  ? '' : $producto['SUBSUBCATEGORIA']
								   ,empty($producto['MARCA']) || is_array($producto['MARCA'])  ? '' : $producto['MARCA']
								   ,empty($producto['ACTIVO']) || is_array($producto['ACTIVO'])  ? '' : $producto['ACTIVO']
								   ,empty($producto['FICHA']) || is_array($producto['FICHA']) ? '' : utf8_encode($producto['FICHA'])
								   ,empty($producto['ID']) || is_array($producto['ID']) ? '' : $producto['ID']
								   ,empty($producto['DESCRIP']) || is_array($producto['DESCRIP']) ? '' : $producto['DESCRIP']
								   ,empty($producto['STOCK_FI']) || is_array($producto['STOCK_FI']) ? '' : $producto['STOCK_FI']
								   ,empty($producto['SUPER_FAM']) || is_array($producto['SUPER_FAM']) ? '' : $producto['SUPER_FAM']
								   ,empty($producto['FAMILIA']) || is_array($producto['FAMILIA']) ?  '' : $producto['FAMILIA']
								   ,empty($producto['CATEGORIAS']) || is_array($producto['CATEGORIAS']) ?  '' : $producto['CATEGORIAS']
								   ,empty($producto['STOCK_SEGURIDAD']) || is_array($producto['STOCK_SEGURIDAD']) ?  '' : $producto['STOCK_SEGURIDAD']
								   ,empty($producto['APERNADURA']) || is_array($producto['APERNADURA'])  ? '': $producto['APERNADURA']
								   ,empty($producto['ARO']) || is_array($producto['ARO'])  ? '': $producto['ARO']
								   ,empty($producto['ANCHO_LLANTA']) || is_array($producto['ANCHO_LLANTA'])  ? '': $producto['ANCHO_LLANTA']
								   ,empty($producto['ANCHO']) || is_array($producto['ANCHO'])  ? '': $producto['ANCHO']
								   ,empty($producto['PERFIL']) || is_array($producto['PERFIL'])  ? '': $producto['PERFIL']
								   ,empty($producto['FECHA_COMPRA']) || is_array($producto['FECHA_COMPRA'])  ? '': $producto['FECHA_COMPRA']
								   ,empty($producto['OFERTA_MAYORISTA']) || is_array($producto['OFERTA_MAYORISTA'])  ? '': $producto['OFERTA_MAYORISTA']
								   ,empty($producto['OFERTA_PUBLICO']) || is_array($producto['OFERTA_PUBLICO'])  ? '': $producto['OFERTA_PUBLICO']
								   ,empty($producto['STOCK_COMPRA']) || is_array($producto['STOCK_COMPRA'])  ? '': $producto['STOCK_COMPRA']
								   ,$slug
								   ,empty($producto['FECHA']) || is_array($producto['FECHA'])  ? '': $producto['FECHA']
								));
							}
						}
					}else{
						$this->out('Error en llamada al WS');
						$this->out($result);
						$this->out($ws->getError());
					}
				}
				$this->Producto->query('CALL masivo_productos');
				$this->out('Productos Cargados en base de datos');
			}
		}else{
			$this->out('Error en llamada al WS');
			$this->out($result);
			$this->out($ws->getError());
		}
		exit;
	}
}
