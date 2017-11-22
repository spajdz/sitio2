<?php
App::uses('AppModel', 'Model');
class Sucursal extends AppModel
{
	/**
	 * CONFIGURACION DB
	 */
	public $displayField	= 'nombre';

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
		'nombre' => array(
			'notBlank' => array(
				'rule'			=> array('notBlank'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'slug' => array(
			'notBlank' => array(
				'rule'			=> array('notBlank'),
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
		'Administrador' => array(
			'className'				=> 'Administrador',
			'foreignKey'			=> 'administrador_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'sucursal_activo_count'			=> array('Sucursal.activo' => true),
				'sucursal_inactivo_count'			=> array('Sucursal.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Administrador')
		),
		'TipoSucursal' => array(
			'className'				=> 'TipoSucursal',
			'foreignKey'			=> 'tipo_sucursal_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'sucursal_activo_count'			=> array('Sucursal.activo' => true),
				'sucursal_inactivo_count'			=> array('Sucursal.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'TipoSucursal')
		)
	);
	public $hasMany = array(
		'Compra' => array(
			'className'				=> 'Compra',
			'foreignKey'			=> 'sucursal_id',
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
	public $hasAndBelongsToMany = array(
		'Servicio' => array(
			'className'				=> 'Servicio',
			'joinTable'				=> 'servicios_sucursales',
			'foreignKey'			=> 'sucursal_id',
			'associationForeignKey'	=> 'servicio_id',
			'unique'				=> true,
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			'limit'					=> '',
			'offset'				=> '',
			'finderQuery'			=> '',
			'deleteQuery'			=> '',
			'insertQuery'			=> ''
		)
	);
}
