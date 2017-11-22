<?php
App::uses('AppModel', 'Model');
class Compra extends AppModel
{
	/**
	 * CONFIGURACION DB
	 */

	/**
	 * BEHAVIORS
	 */
	var $actsAs			= array(
		/**
		 * IMAGE UPLOAD
		 */
		/*
		'Image'		=> array(
			'fields'	=> array(
				'imagen'	=> array(
					'versions'	=> array(
						array(
							'prefix'	=> 'mini',
							'width'		=> 100,
							'height'	=> 100,
							'crop'		=> true
						)
					)
				)
			)
		)
		*/
	);

	/**
	 * VALIDACIONES
	 */
	public $validate = array(
		'retiro_sucursal' => array(
			'boolean' => array(
				'rule'			=> array('boolean'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'subtotal' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'valor_despacho' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'total' => array(
			'numeric' => array(
				'rule'			=> array('numeric'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
	);

	/**
	 * ASOCIACIONES
	 */
	public $belongsTo = array(
		'Usuario' => array(
			'className'				=> 'Usuario',
			'foreignKey'			=> 'usuario_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'compra_activo_count'			=> array('Compra.activo' => true),
				'compra_inactivo_count'			=> array('Compra.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Usuario')
		),
		'EstadoCompra' => array(
			'className'				=> 'EstadoCompra',
			'foreignKey'			=> 'estado_compra_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'compra_activo_count'			=> array('Compra.activo' => true),
				'compra_inactivo_count'			=> array('Compra.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'EstadoCompra')
		),
		'Direccion' => array(
			'className'				=> 'Direccion',
			'foreignKey'			=> 'direccion_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'compra_activo_count'			=> array('Compra.activo' => true),
				'compra_inactivo_count'			=> array('Compra.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Direccion')
		),
		'Sucursal' => array(
			'className'				=> 'Sucursal',
			'foreignKey'			=> 'sucursal_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'compra_activo_count'			=> array('Compra.activo' => true),
				'compra_inactivo_count'			=> array('Compra.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Sucursal')
		)
	);
	public $hasMany = array(
		'Email' => array(
			'className'				=> 'Email',
			'foreignKey'			=> 'compra_id',
			'dependent'				=> false,
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'limit'					=> '',
			'offset'				=> '',
			'exclusive'				=> '',
			'finderQuery'			=> '',
			'counterQuery'			=> ''
		)
	);
}
