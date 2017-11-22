<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Sucursales</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Nuevo Sucursal</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('Sucursal', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('administrador_id', 'Administrador'); ?></th>
								<td><?= $this->Form->input('administrador_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tipo_sucursal_id', 'Tipo sucursal'); ?></th>
								<td><?= $this->Form->input('tipo_sucursal_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('nombre', 'Nombre'); ?></th>
								<td><?= $this->Form->input('nombre', array('placeholder' => 'Nombre')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('direccion', 'Direccion'); ?></th>
								<td><?= $this->Form->input('direccion', array('placeholder' => 'Direccion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('telefono', 'Telefono'); ?></th>
								<td><?= $this->Form->input('telefono', array('placeholder' => 'Telefono')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('email', 'Email'); ?></th>
								<td><?= $this->Form->input('email', array('placeholder' => 'Email')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('hr_semana', 'Hr semana'); ?></th>
								<td><?= $this->Form->input('hr_semana', array('placeholder' => 'Hr semana')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('hr_sabado', 'Hr sabado'); ?></th>
								<td><?= $this->Form->input('hr_sabado', array('placeholder' => 'Hr sabado')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('hr_domingo', 'Hr domingo'); ?></th>
								<td><?= $this->Form->input('hr_domingo', array('placeholder' => 'Hr domingo')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('imagen', 'Imagen'); ?></th>
								<td><?= $this->Form->input('imagen', array('type' => 'file')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('latitud', 'Latitud'); ?></th>
								<td><?= $this->Form->input('latitud', array('placeholder' => 'Latitud')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('longitud', 'Longitud'); ?></th>
								<td><?= $this->Form->input('longitud', array('placeholder' => 'Longitud')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('retiro_sucursal', 'Retiro sucursal'); ?></th>
								<td><?= $this->Form->input('retiro_sucursal', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('activo', 'Activo'); ?></th>
								<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('eliminado', 'Eliminado'); ?></th>
								<td><?= $this->Form->input('eliminado', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('Servicio', 'Servicio'); ?></th>
								<td><?= $this->Form->input('Servicio'); ?></td>
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
