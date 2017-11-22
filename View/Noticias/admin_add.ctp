<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Noticias</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Nuevo Noticia</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('Noticia', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('administrador_id', 'Administrador'); ?></th>
								<td><?= $this->Form->input('administrador_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('titulo', 'Titulo'); ?></th>
								<td><?= $this->Form->input('titulo', array('placeholder' => 'Titulo')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('extracto', 'Extracto'); ?></th>
								<td><?= $this->Form->input('extracto', array('placeholder' => 'Extracto')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('cuerpo', 'Cuerpo'); ?></th>
								<td><?= $this->Form->input('cuerpo', array('placeholder' => 'Cuerpo')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('imagen', 'Imagen'); ?></th>
								<td><?= $this->Form->input('imagen', array('type' => 'file')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('imagen_mobile', 'Imagen mobile'); ?></th>
								<td><?= $this->Form->input('imagen_mobile', array('placeholder' => 'Imagen mobile')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('activo', 'Activo'); ?></th>
								<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
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