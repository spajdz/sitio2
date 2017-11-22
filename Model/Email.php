<?php
App::uses('AppModel', 'Model');
class Email extends AppModel
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
				'email_activo_count'			=> array('Email.activo' => true),
				'email_inactivo_count'			=> array('Email.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Compra')
		)
	);
}
