<?php
App::uses('AppController', 'Controller');
class DetalleCargasController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$detalleCargas	= $this->paginate();
		$this->set(compact('detalleCargas'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->DetalleCarga->create();
			if ( $this->DetalleCarga->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		$cargas	= $this->DetalleCarga->Carga->find('list');
		$this->set(compact('cargas'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->DetalleCarga->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->DetalleCarga->save($this->request->data) )
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
			$this->request->data	= $this->DetalleCarga->find('first', array(
				'conditions'	=> array('DetalleCarga.id' => $id)
			));
		}
		$cargas	= $this->DetalleCarga->Carga->find('list');
		$this->set(compact('cargas'));
	}

	public function admin_delete($id = null)
	{
		$this->DetalleCarga->id = $id;
		if ( ! $this->DetalleCarga->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->DetalleCarga->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->DetalleCarga->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->DetalleCarga->_schema);
		$modelo			= $this->DetalleCarga->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}
}
