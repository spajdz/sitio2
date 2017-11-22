<?php
App::uses('AppModel', 'Model');
class DetalleCarga extends AppModel
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
		'mensaje' => array(
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
		'Carga' => array(
			'className'				=> 'Carga',
			'foreignKey'			=> 'carga_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'detallecarga_activo_count'			=> array('DetalleCarga.activo' => true),
				'detallecarga_inactivo_count'			=> array('DetalleCarga.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Carga')
		)
	);
}
