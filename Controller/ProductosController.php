<?php
App::uses('AppController', 'Controller');
class ProductosController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$productos	= $this->paginate();
		$this->set(compact('productos'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Producto->create();
			if ( $this->Producto->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		$categorias	= $this->Producto->Categoria->find('list');
		$marcas	= $this->Producto->Marca->find('list');
		$this->set(compact('categorias', 'marcas'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->Producto->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Producto->save($this->request->data) )
			{
				$this->Session->setFlash('Registro editado correctamente', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		else
		{
			$this->request->data	= $this->Producto->find('first', array(
				'conditions'	=> array('Producto.id' => $id)
			));
		}
		$categorias	= $this->Producto->Categoria->find('list');
		$marcas	= $this->Producto->Marca->find('list');
		$this->set(compact('categorias', 'marcas'));
	}

	public function admin_delete($id = null)
	{
		$this->Producto->id = $id;
		if ( ! $this->Producto->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->Producto->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->Producto->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->Producto->_schema);
		$modelo			= $this->Producto->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}

	public function admin_activar($id = null)
	{
		$this->Producto->id = $id;
		if ( ! $this->Producto->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->Producto->saveField('activo', true) )
		{
			$this->Session->setFlash('Registro activado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al activar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_desactivar($id = null)
	{
		$this->Producto->id = $id;
		if ( ! $this->Producto->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->Producto->saveField('activo', false) )
		{
			$this->Session->setFlash('Registro desactivado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al desactivar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function index($categoria = null){

		switch ($categoria) {
			case 'neumaticos':
				$categoria_id = 2;
				break;
			case 'llantas':
				$categoria_id = 1;
				break;
			case 'accesorios':
				$categoria_id = 3;
				break;
			default:
				$categoria_id = '';
				break;
		}

		if(empty($categoria_id)){
			$this->redirect('/');
		}

		$productos = $this->Producto->find('all', array(
			'conditions' => array(
				'Producto.activo' => 1,
				'Producto.categoria_id' => $categoria_id
			),
			'fields' => array(
				'Producto.sku'
				,'Producto.nombre'
				,'Producto.slug'
				,'Producto.stock'
				,'Producto.precio_publico'
				,'Producto.oferta_publico'
				,'Producto.dcto_publico'
				,'Producto.preciofinal_publico'
				,'Producto.preciofinal_publico'
			)
		));

		$this->set(compact('productos', 'categoria'));
	}

	public function categorias($categoria = null, $categoria_b = null,  $subcategoria_b = null, $subsubcategoria_b = null){

		if(empty($categoria)){
			$this->Producto->redirect('/');
		}

		if(empty($categoria_b)){
			$this->redirect('/'.$categoria);
		}

		$condiciones['Producto.activo'] = 1;

		if($categoria == 'neumaticos'){
			$condiciones['Producto.categoria_id'] = 2;
			$condiciones['Producto.ancho'] = trim($categoria_b);
			if(!empty($subcategoria_b)){
				$condiciones['Producto.perfil'] = trim($subcategoria_b);
				if(!empty($subsubcategoria_b)){
					$condiciones['Producto.aro'] = trim($subsubcategoria_b);
				}
			}
		}

		$this->paginate	= array(
				'conditions' => $condiciones,
				'limit' => 1
			);
		$productos	= $this->paginate();


		prx($productos);
	}
}
