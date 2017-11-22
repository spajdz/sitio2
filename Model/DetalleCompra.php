<?php
App::uses('AppModel', 'Model');
class DetalleCompra extends AppModel
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
		'precio_unitario' => array(
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
		'Compra' => array(
			'className'				=> 'Compra',
			'foreignKey'			=> 'compra_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'detallecompra_activo_count'			=> array('DetalleCompra.activo' => true),
				'detallecompra_inactivo_count'			=> array('DetalleCompra.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Compra')
		),
		'Producto' => array(
			'className'				=> 'Producto',
			'foreignKey'			=> 'producto_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'detallecompra_activo_count'			=> array('DetalleCompra.activo' => true),
				'detallecompra_inactivo_count'			=> array('DetalleCompra.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Producto')
		)
	);
}
