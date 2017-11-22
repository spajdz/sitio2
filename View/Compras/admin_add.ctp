<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Compras</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Nuevo Compra</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('Compra', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('usuario_id', 'Usuario'); ?></th>
								<td><?= $this->Form->input('usuario_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('estado_compra_id', 'Estado compra'); ?></th>
								<td><?= $this->Form->input('estado_compra_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('retiro_sucursal', 'Retiro sucursal'); ?></th>
								<td><?= $this->Form->input('retiro_sucursal', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('direccion_id', 'Direccion'); ?></th>
								<td><?= $this->Form->input('direccion_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('sucursal_id', 'Sucursal'); ?></th>
								<td><?= $this->Form->input('sucursal_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('subtotal', 'Subtotal'); ?></th>
								<td><?= $this->Form->input('subtotal', array('placeholder' => 'Subtotal')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('valor_despacho', 'Valor despacho'); ?></th>
								<td><?= $this->Form->input('valor_despacho', array('placeholder' => 'Valor despacho')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('despacho_gratis', 'Despacho gratis'); ?></th>
								<td><?= $this->Form->input('despacho_gratis', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('total_descuentos', 'Total descuentos'); ?></th>
								<td><?= $this->Form->input('total_descuentos', array('placeholder' => 'Total descuentos')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('total', 'Total'); ?></th>
								<td><?= $this->Form->input('total', array('placeholder' => 'Total')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('pagado', 'Pagado'); ?></th>
								<td><?= $this->Form->input('pagado', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('aceptado', 'Aceptado'); ?></th>
								<td><?= $this->Form->input('aceptado', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('reversado', 'Reversado'); ?></th>
								<td><?= $this->Form->input('reversado', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_orden_compra', 'Tbk orden compra'); ?></th>
								<td><?= $this->Form->input('tbk_orden_compra', array('placeholder' => 'Tbk orden compra')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_tipo_transaccion', 'Tbk tipo transaccion'); ?></th>
								<td><?= $this->Form->input('tbk_tipo_transaccion', array('placeholder' => 'Tbk tipo transaccion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_respuesta', 'Tbk respuesta'); ?></th>
								<td><?= $this->Form->input('tbk_respuesta', array('placeholder' => 'Tbk respuesta')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_monto', 'Tbk monto'); ?></th>
								<td><?= $this->Form->input('tbk_monto', array('placeholder' => 'Tbk monto')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_codigo_autorizacion', 'Tbk codigo autorizacion'); ?></th>
								<td><?= $this->Form->input('tbk_codigo_autorizacion', array('placeholder' => 'Tbk codigo autorizacion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_final_numero_tarjeta', 'Tbk final numero tarjeta'); ?></th>
								<td><?= $this->Form->input('tbk_final_numero_tarjeta', array('placeholder' => 'Tbk final numero tarjeta')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_fecha_contable', 'Tbk fecha contable'); ?></th>
								<td><?= $this->Form->input('tbk_fecha_contable', array('placeholder' => 'Tbk fecha contable')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_fecha_transaccion', 'Tbk fecha transaccion'); ?></th>
								<td><?= $this->Form->input('tbk_fecha_transaccion', array('placeholder' => 'Tbk fecha transaccion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_hora_transaccion', 'Tbk hora transaccion'); ?></th>
								<td><?= $this->Form->input('tbk_hora_transaccion', array('placeholder' => 'Tbk hora transaccion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_id_sesion', 'Tbk id sesion'); ?></th>
								<td><?= $this->Form->input('tbk_id_sesion', array('placeholder' => 'Tbk id sesion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_id_transaccion', 'Tbk id transaccion'); ?></th>
								<td><?= $this->Form->input('tbk_id_transaccion', array('placeholder' => 'Tbk id transaccion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_tipo_pago', 'Tbk tipo pago'); ?></th>
								<td><?= $this->Form->input('tbk_tipo_pago', array('placeholder' => 'Tbk tipo pago')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_numero_cuotas', 'Tbk numero cuotas'); ?></th>
								<td><?= $this->Form->input('tbk_numero_cuotas', array('placeholder' => 'Tbk numero cuotas')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_vci', 'Tbk vci'); ?></th>
								<td><?= $this->Form->input('tbk_vci', array('placeholder' => 'Tbk vci')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('tbk_mac', 'Tbk mac'); ?></th>
								<td><?= $this->Form->input('tbk_mac', array('placeholder' => 'Tbk mac')); ?></td>
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
