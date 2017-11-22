<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Productos</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Editar Producto</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('Producto', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<?= $this->Form->input('id'); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('id_erp', 'Id erp'); ?></th>
								<td><?= $this->Form->input('id_erp', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('sku', 'Sku'); ?></th>
								<td><?= $this->Form->input('sku', array('placeholder' => 'Sku')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('nombre', 'Nombre'); ?></th>
								<td><?= $this->Form->input('nombre', array('placeholder' => 'Nombre')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('descripcion', 'Descripcion'); ?></th>
								<td><?= $this->Form->input('descripcion', array('placeholder' => 'Descripcion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('ficha', 'Ficha'); ?></th>
								<td><?= $this->Form->input('ficha', array('placeholder' => 'Ficha')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('categoria_id', 'Categoria'); ?></th>
								<td><?= $this->Form->input('categoria_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('marca_id', 'Marca'); ?></th>
								<td><?= $this->Form->input('marca_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock', 'Stock'); ?></th>
								<td><?= $this->Form->input('stock', array('placeholder' => 'Stock')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_fisico', 'Stock fisico'); ?></th>
								<td><?= $this->Form->input('stock_fisico', array('placeholder' => 'Stock fisico')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_compra', 'Stock compra'); ?></th>
								<td><?= $this->Form->input('stock_compra', array('placeholder' => 'Stock compra')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('precio_publico', 'Precio publico'); ?></th>
								<td><?= $this->Form->input('precio_publico', array('placeholder' => 'Precio publico')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('oferta_publico', 'Oferta publico'); ?></th>
								<td><?= $this->Form->input('oferta_publico', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('dcto_publico', 'Dcto publico'); ?></th>
								<td><?= $this->Form->input('dcto_publico', array('placeholder' => 'Dcto publico')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('preciofinal_publico', 'Preciofinal publico'); ?></th>
								<td><?= $this->Form->input('preciofinal_publico', array('placeholder' => 'Preciofinal publico')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('precio_mayorista', 'Precio mayorista'); ?></th>
								<td><?= $this->Form->input('precio_mayorista', array('placeholder' => 'Precio mayorista')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('oferta_mayorista', 'Oferta mayorista'); ?></th>
								<td><?= $this->Form->input('oferta_mayorista', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('dcto_mayorista', 'Dcto mayorista'); ?></th>
								<td><?= $this->Form->input('dcto_mayorista', array('placeholder' => 'Dcto mayorista')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('preciofinal_mayorista', 'Preciofinal mayorista'); ?></th>
								<td><?= $this->Form->input('preciofinal_mayorista', array('placeholder' => 'Preciofinal mayorista')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('apernaduras', 'Apernaduras'); ?></th>
								<td><?= $this->Form->input('apernaduras', array('placeholder' => 'Apernaduras')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('apernadura1', 'Apernadura1'); ?></th>
								<td><?= $this->Form->input('apernadura1', array('placeholder' => 'Apernadura1')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('apernadura2', 'Apernadura2'); ?></th>
								<td><?= $this->Form->input('apernadura2', array('placeholder' => 'Apernadura2')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('aro', 'Aro'); ?></th>
								<td><?= $this->Form->input('aro', array('placeholder' => 'Aro')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('ancho', 'Ancho'); ?></th>
								<td><?= $this->Form->input('ancho', array('placeholder' => 'Ancho')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('perfil', 'Perfil'); ?></th>
								<td><?= $this->Form->input('perfil', array('placeholder' => 'Perfil')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('fecha_modificacion', 'Fecha modificacion'); ?></th>
								<td><?= $this->Form->input('fecha_modificacion', array('placeholder' => 'Fecha modificacion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('hora_modificacion', 'Hora modificacion'); ?></th>
								<td><?= $this->Form->input('hora_modificacion', array('placeholder' => 'Hora modificacion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_b015', 'Stock b015'); ?></th>
								<td><?= $this->Form->input('stock_b015', array('placeholder' => 'Stock b015')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_b301', 'Stock b301'); ?></th>
								<td><?= $this->Form->input('stock_b301', array('placeholder' => 'Stock b301')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_b401', 'Stock b401'); ?></th>
								<td><?= $this->Form->input('stock_b401', array('placeholder' => 'Stock b401')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_b701', 'Stock b701'); ?></th>
								<td><?= $this->Form->input('stock_b701', array('placeholder' => 'Stock b701')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_b901', 'Stock b901'); ?></th>
								<td><?= $this->Form->input('stock_b901', array('placeholder' => 'Stock b901')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_bclm', 'Stock bclm'); ?></th>
								<td><?= $this->Form->input('stock_bclm', array('placeholder' => 'Stock bclm')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_bvtm', 'Stock bvtm'); ?></th>
								<td><?= $this->Form->input('stock_bvtm', array('placeholder' => 'Stock bvtm')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('stock_blco', 'Stock blco'); ?></th>
								<td><?= $this->Form->input('stock_blco', array('placeholder' => 'Stock blco')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('activo', 'Activo'); ?></th>
								<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('agotado', 'Agotado'); ?></th>
								<td><?= $this->Form->input('agotado', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('eliminado', 'Eliminado'); ?></th>
								<td><?= $this->Form->input('eliminado', array('class' => 'icheckbox')); ?></td>
							</tr>
						</table>
		
						<div class="pull-right">
							<input type="submit" class="btn btn-primary esperar-carga" autocomplete="off" data-loading-text="Espera un momento..." value="Guardar cambios">
							<?= $this->Html->link('Cancelar', array('action' => 'index'), array('class' => 'btn btn-danger')); ?>
						</div>
					<?= $this->Form->end(); ?>
				</div>
			</div>
		</div>
	</div>
</div>
