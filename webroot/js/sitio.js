fullwebroot = 'localhost/sitiov2/';
$(document).ready(function(){
	$('.js-buscar-productos').click(function(){
		var categoria = $('#ProductoCategoria').val();
		var url,ancho,apernadura,perfil,aro;

		switch(categoria) {
		    case 'neumaticos':
		    	url 	= 'neumaticos/';

		    	ancho 	= $('#ProductoAncho').val();
		    	perfil 	= $('#ProductoPerfil').val();
		    	aro 	= $('#ProductoAro').val();

		    	if(typeof ancho != 'undefined' && ancho != null && ancho != '' ){
		    		url += ancho;
		    		if(typeof perfil != 'undefined' && perfil != null && perfil != '' ){
		    			url += '/' + perfil;
		    			if(typeof aro != 'undefined' && aro != null && aro != '' ){
		    				url += '/' + aro;
		    			}
		    		}
		    	}
		        break;
		    case 'llantas':
		        alert('llantas')
		        break;
		    case 'accesorios':
		        alert('accesorios')
		        break;
		    default:
		        alert('sin categoria')
		}

		window.location =  url;
		return false;

	})

})