<?php
App::uses('AppModel', 'Model');
class Direccion extends AppModel
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
		'calle' => array(
			'notBlank' => array(
				'rule'			=> array('notBlank'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'numero' => array(
			'notBlank' => array(
				'rule'			=> array('notBlank'),
				'last'			=> true,
				//'message'		=> 'Mensaje de validación personalizado',
				//'allowEmpty'	=> true,
				//'required'		=> false,
				//'on'			=> 'update', // Solo valida en operaciones de 'create' o 'update'
			),
		),
		'codigo_postal' => array(
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
				'direccion_activo_count'			=> array('Direccion.activo' => true),
				'direccion_inactivo_count'			=> array('Direccion.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Usuario')
		),
		'TipoDireccion' => array(
			'className'				=> 'TipoDireccion',
			'foreignKey'			=> 'tipo_direccion_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'direccion_activo_count'			=> array('Direccion.activo' => true),
				'direccion_inactivo_count'			=> array('Direccion.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'TipoDireccion')
		),
		'Comuna' => array(
			'className'				=> 'Comuna',
			'foreignKey'			=> 'comuna_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'direccion_activo_count'			=> array('Direccion.activo' => true),
				'direccion_inactivo_count'			=> array('Direccion.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Comuna')
		)
	);
	public $hasMany = array(
		'Compra' => array(
			'className'				=> 'Compra',
			'foreignKey'			=> 'direccion_id',
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
