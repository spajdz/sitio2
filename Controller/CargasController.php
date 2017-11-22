<?php
App::uses('AppController', 'Controller');
class CargasController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$cargas	= $this->paginate();
		$this->set(compact('cargas'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Carga->create();
			if ( $this->Carga->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		$administradores	= $this->Carga->Administrador->find('list');
		$this->set(compact('administradores'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->Carga->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Carga->save($this->request->data) )
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
			$this->request->data	= $this->Carga->find('first', array(
				'conditions'	=> array('Carga.id' => $id)
			));
		}
		$administradores	= $this->Carga->Administrador->find('list');
		$this->set(compact('administradores'));
	}

	public function admin_delete($id = null)
	{
		$this->Carga->id = $id;
		if ( ! $this->Carga->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->Carga->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->Carga->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->Carga->_schema);
		$modelo			= $this->Carga->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}
}
