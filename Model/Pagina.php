<?php
App::uses('AppModel', 'Model');
class Pagina extends AppModel
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
				'pagina_activo_count'			=> array('Pagina.activo' => true),
				'pagina_inactivo_count'			=> array('Pagina.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'Administrador')
		),
		'CategoriaPagina' => array(
			'className'				=> 'CategoriaPagina',
			'foreignKey'			=> 'categoria_pagina_id',
			'conditions'			=> '',
			'fields'				=> '',
			'order'					=> '',
			/*
			'counterCache'			=> array(
				'pagina_activo_count'			=> array('Pagina.activo' => true),
				'pagina_inactivo_count'			=> array('Pagina.activo' => false)
			),
			*/
			//'counterScope'			=> array('Asociado.modelo' => 'CategoriaPagina')
		)
	);
}
