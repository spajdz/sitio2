<?php
App::uses('AppController', 'Controller');
class VehiculosController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$vehiculos	= $this->paginate();
		$this->set(compact('vehiculos'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Vehiculo->create();
			if ( $this->Vehiculo->save($this->request->data) )
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
		if ( ! $this->Vehiculo->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Vehiculo->save($this->request->data) )
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
			$this->request->data	= $this->Vehiculo->find('first', array(
				'conditions'	=> array('Vehiculo.id' => $id)
			));
		}
	}

	public function admin_delete($id = null)
	{
		$this->Vehiculo->id = $id;
		if ( ! $this->Vehiculo->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->Vehiculo->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->Vehiculo->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->Vehiculo->_schema);
		$modelo			= $this->Vehiculo->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}
}
