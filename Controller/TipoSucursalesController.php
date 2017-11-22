<?php
App::uses('AppController', 'Controller');
class TipoSucursalesController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$tipoSucursales	= $this->paginate();
		$this->set(compact('tipoSucursales'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->TipoSucursal->create();
			if ( $this->TipoSucursal->save($this->request->data) )
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
		if ( ! $this->TipoSucursal->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->TipoSucursal->save($this->request->data) )
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
			$this->request->data	= $this->TipoSucursal->find('first', array(
				'conditions'	=> array('TipoSucursal.id' => $id)
			));
		}
	}

	public function admin_delete($id = null)
	{
		$this->TipoSucursal->id = $id;
		if ( ! $this->TipoSucursal->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->TipoSucursal->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->TipoSucursal->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->TipoSucursal->_schema);
		$modelo			= $this->TipoSucursal->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}
}
