<?php
App::uses('AppController', 'Controller');
class ComprasController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$compras	= $this->paginate();
		$this->set(compact('compras'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->Compra->create();
			if ( $this->Compra->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		$usuarios	= $this->Compra->Usuario->find('list');
		$estadoCompras	= $this->Compra->EstadoCompra->find('list');
		$direcciones	= $this->Compra->Direccion->find('list');
		$sucursales	= $this->Compra->Sucursal->find('list');
		$this->set(compact('usuarios', 'estadoCompras', 'direcciones', 'sucursales'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->Compra->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->Compra->save($this->request->data) )
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
			$this->request->data	= $this->Compra->find('first', array(
				'conditions'	=> array('Compra.id' => $id)
			));
		}
		$usuarios	= $this->Compra->Usuario->find('list');
		$estadoCompras	= $this->Compra->EstadoCompra->find('list');
		$direcciones	= $this->Compra->Direccion->find('list');
		$sucursales	= $this->Compra->Sucursal->find('list');
		$this->set(compact('usuarios', 'estadoCompras', 'direcciones', 'sucursales'));
	}

	public function admin_delete($id = null)
	{
		$this->Compra->id = $id;
		if ( ! $this->Compra->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->Compra->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->Compra->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->Compra->_schema);
		$modelo			= $this->Compra->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}
}
