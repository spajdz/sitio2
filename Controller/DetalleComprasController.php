<?php
App::uses('AppController', 'Controller');
class DetalleComprasController extends AppController
{
	public function admin_index()
	{
		$this->paginate		= array(
			'recursive'			=> 0
		);
		$detalleCompras	= $this->paginate();
		$this->set(compact('detalleCompras'));
	}

	public function admin_add()
	{
		if ( $this->request->is('post') )
		{
			$this->DetalleCompra->create();
			if ( $this->DetalleCompra->save($this->request->data) )
			{
				$this->Session->setFlash('Registro agregado correctamente.', null, array(), 'success');
				$this->redirect(array('action' => 'index'));
			}
			else
			{
				$this->Session->setFlash('Error al guardar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
			}
		}
		$compras	= $this->DetalleCompra->Compra->find('list');
		$productos	= $this->DetalleCompra->Producto->find('list');
		$this->set(compact('compras', 'productos'));
	}

	public function admin_edit($id = null)
	{
		if ( ! $this->DetalleCompra->exists($id) )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		if ( $this->request->is('post') || $this->request->is('put') )
		{
			if ( $this->DetalleCompra->save($this->request->data) )
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
			$this->request->data	= $this->DetalleCompra->find('first', array(
				'conditions'	=> array('DetalleCompra.id' => $id)
			));
		}
		$compras	= $this->DetalleCompra->Compra->find('list');
		$productos	= $this->DetalleCompra->Producto->find('list');
		$this->set(compact('compras', 'productos'));
	}

	public function admin_delete($id = null)
	{
		$this->DetalleCompra->id = $id;
		if ( ! $this->DetalleCompra->exists() )
		{
			$this->Session->setFlash('Registro inválido.', null, array(), 'danger');
			$this->redirect(array('action' => 'index'));
		}

		$this->request->onlyAllow('post', 'delete');
		if ( $this->DetalleCompra->delete() )
		{
			$this->Session->setFlash('Registro eliminado correctamente.', null, array(), 'success');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash('Error al eliminar el registro. Por favor intenta nuevamente.', null, array(), 'danger');
		$this->redirect(array('action' => 'index'));
	}

	public function admin_exportar()
	{
		$datos			= $this->DetalleCompra->find('all', array(
			'recursive'				=> -1
		));
		$campos			= array_keys($this->DetalleCompra->_schema);
		$modelo			= $this->DetalleCompra->alias;

		$this->set(compact('datos', 'campos', 'modelo'));
	}
}
