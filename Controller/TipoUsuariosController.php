<?php
App::uses('AppController', 'Controller');
class TipoUsuariosController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$tipoUsuarios	= $this->paginate();
		$this->set(compact('tipoUsuarios'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->TipoUsuario->create();
			if ( $this->TipoUsuario->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->TipoUsuario->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->TipoUsuario->save($this->request->data) )
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
			$this->request->data	= $this->TipoUsuario->find('first', array(
				'conditions'	=> array('TipoUsuario.id' => $id)
			));
		}
	}

	public function admin_delete($id = null)
	{
		$this->TipoUsuario->id = $id;
		if ( ! $this->TipoUsuario->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->TipoUsuario->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->TipoUsuario->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->TipoUsuario->_schema);
		$modelo			= $this->TipoUsuario->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}

	public function admin_activar($id = null)
	{
		$this->TipoUsuario->id = $id;
		if ( ! $this->TipoUsuario->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->TipoUsuario->saveField('activo', true) )
		{
			$this->Session->setFlash('Registro activado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al activar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_desactivar($id = null)
	{
		$this->TipoUsuario->id = $id;
		if ( ! $this->TipoUsuario->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->TipoUsuario->saveField('activo', false) )
		{
			$this->Session->setFlash('Registro desactivado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al desactivar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}
}
