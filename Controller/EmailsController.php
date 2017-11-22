<?php
App::uses('AppController', 'Controller');
class EmailsController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$emails	= $this->paginate();
		$this->set(compact('emails'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Email->create();
			if ( $this->Email->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		$compras	= $this->Email->Compra->find('list');
		$this->set(compact('compras'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->Email->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Email->save($this->request->data) )
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
			$this->request->data	= $this->Email->find('first', array(
				'conditions'	=> array('Email.id' => $id)
			));
		}
		$compras	= $this->Email->Compra->find('list');
		$this->set(compact('compras'));
	}

	public function admin_delete($id = null)
	{
		$this->Email->id = $id;
		if ( ! $this->Email->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->Email->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->Email->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->Email->_schema);
		$modelo			= $this->Email->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}
}
