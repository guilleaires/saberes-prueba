extends Node

export var Pregunta:PackedScene
var Tierra:Array
var Tierra_Sol:Array
var Astrologia:Array
onready var texturas = $Imagenes
onready var categorias_cargadas:Array = []

var _data = {
	"Tierra" : {
		"Pregunta_1" : {
		"Pregunta": "Según lo que sepas, ¿te parece que es correcta la representación de la Tierra?",
		"Respuestas": ["Sí, es correcta", "No, la tierra es plana", "No, la Tierra tiene forma parecida a una pelota y los polos de la Tierra no pueden estar iluminados a la vez","No, la Tierra tiene forma parecida a una pelota, pero gira hacia el otro lado, iluminando primero desde el oeste"],
		"Respuesta_correcta": 2,
		"Siguiente_correcta": 3,
		"Siguiente_incorrecta": 1,
		"Textura":0
		},
		"Pregunta_2" : {
		"Pregunta": " Según lo que vos sabes ¿es una representación real?",
		"Respuestas": ["Sí, es la representación real de la Tierra", "No, la Tierra tiene forma de pelota"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 3,
		"Siguiente_incorrecta": 2,
		"Textura":0
		} ,
		"Pregunta_3" : {
		"Pregunta": "¿Por qué piensas que la Tierra es plana?",
		"Respuestas": ["Porque me lo enseñaron así en la escuela", "Porque lo escuche en un video en internet o en la televisión", "Porque lo contó un amigo o una amiga","Porque miro al horizonte y veo que es plano"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 3,
		"Siguiente_incorrecta": 3,
		"Textura":3
		} ,
		"Pregunta_4" : {
		"Pregunta": "En el caso de que la Tierra no tenga ningún tipo de inclinación. ¿Qué efectos podríamos observar?",
		"Respuestas": ["No notaremos ningún cambio", "Podría ser de día en dos lugares sobre el mismo meridiano, pero en distintos hemisferios", "Podría estar en verano 2 lugares sobre el mismo meridiano, pero en distintos hemisferios","Podría ser verano y de día en dos lugares a la misma longitud, pero en distintos hemisferios","No tendríamos estaciones", "En el hemisferio norte sería siempre verano y en el hemisferio sur sería siempre invierno"],
		"Respuesta_correcta": 3,
		"Siguiente_correcta": 5,
		"Siguiente_incorrecta": 4,
		"Textura" : 0
		} ,
		"Pregunta_5" : {
		"Pregunta": "Al trasladarse alrededor del Sol, la Tierra mantiene la inclinación de su eje de rotación, lo que produce que, para un dado lugar, la cantidad de horas de luz en el día varíe con el correr del año, provocando lo que conocemos como las estaciones climáticas. ¿Estás de acuerdo?",
		"Respuestas": ["Sí, estoy de acuerdo", "No, la inclinación no afecta las estaciones, solo cambian los lugares donde se ilumina la Tierra", "No, las estaciones cambian porque la Tierra se acerca o aleja del Sol, en verano está más cerca y en invierno más lejos", "No, porque no existe ningún tipo de inclinación del eje de rotación de la Tierra", "No, La Tierra no se mueve"],
		"Respuesta_correcta": 0,
		"Siguiente_correcta": 5,
		"Siguiente_incorrecta": 5,
		"Textura" : 0
		} ,
		"Pregunta_6" : {
		"Pregunta": "La órbita de la Tierra no es del todo circular, por lo que la distancia entre el Sol y la Tierra cambia mientras la Tierra gira alrededor del Sol. ¿Cuál es el efecto que produce esa diferencia en la Tierra?",
		"Respuestas": ["El efecto se ve en las estaciones, en el invierno la Tierra está más lejos del Sol y en verano está más cerca", "No produce ningún tipo de efecto", "El único efecto es que vemos el Sol en distintas posiciones en el cielo.", "El efecto es muy pequeño porque la órbita terrestre es casi circular"],
		"Respuesta_correcta": 3,
		"Siguiente_correcta": 6,
		"Siguiente_incorrecta": 6,
		"Textura" : 0
		} ,
		"Pregunta_7" : {
		"Pregunta": "¿Recordás si alguna vez observaste el cielo por varios días seguidos para saber cómo es el movimiento del Sol o la Luna?",
		"Respuestas": ["Sí", "No"],
		"Respuesta_correcta": 0,
		"Siguiente_correcta": 7,
		"Siguiente_incorrecta": 7,
		"Textura" : 0
		},
		"Pregunta_8" : {
		"Pregunta": "En la imagen se puede observar el movimiento de las estrellas mirando al cielo hacia el norte. ¿Podrías saber mirando el movimiento de las estrellas si estás en el hemisferio norte o en el hemisferio sur?",
		"Respuestas": ["Si, las estrellas aparentan moverse hacia la izquierda, por lo que está en el hemisferio norte", "Si, las estrellas aparentan moverse hacia la izquierda, por lo que está en el hemisferio sur", "No hay manera de saber eso mirando al cielo, depende de las estaciones", "No tiene sentido, las estrellas se mantienen quietas", "No lo se"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 88,
		"Siguiente_incorrecta": 88,
		"Textura" : 0
		}
	} ,
	"Tierra_Sol":{
		"Pregunta_1" : {
		"Pregunta": "¿ALGUNA VEZ OBSERVASTE DÓNDE ESTÁN LAS SOMBRAS DE LOS OBJETOS ILUMINADOS POR EL SOL?",
		"Respuestas": ["SI. LO HICE EN LA ESCUELA", "SI. LO HICE EN OTRO LADO", "NO"],
		"Respuesta_correcta": 2,
		"Siguiente_correcta": 5,
		"Siguiente_incorrecta": 1,
		"Textura":-1
		},
		"Pregunta_2" : {
		"Pregunta": "EN UN DÍA DE SOL,  ¿PODRÍAS IDENTIFICAR LOS PUNTOS CARDINALES SIN USAR UNA BRÚJULA?",
		"Respuestas": ["SI, PORQUE SE QUE EL SOL SALE POR EL ESTE Y SE OCULTA EN EL OESTE", "SI, OBSERVANDO LAS SOMBRAS EN EL SUELO", "NO", "NINGUNA OPCIÓN"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 2,
		"Siguiente_incorrecta": 2,
		"Textura":-1
		}, 
		"Pregunta_3" : {
		"Pregunta": "¿CUÁL DE ESTAS IMÁGENES CORRESPONDEN A  LA SOMBRA QUE HACEN LOS ÁRBOLES CUANDO SON ILUMINADOS POR EL SOL  AL MEDIODÍA?",
		"Respuestas": ["La imagen A", "La imagen B", "No se", "Ninguna opción"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 3,
		"Siguiente_incorrecta": 5,
		"Textura":-1
		}, 
		"Pregunta_4" : {
		"Pregunta": "¿AL MEDIODÍA LA SOMBRA ESTÁ UBICADA EN ALGÚN LUGAR EN ESPECIAL?",
		"Respuestas": ["SI, ESTÁ DESPLAZADA HACIA EL SUR", "SI, ESTÁ DESPLAZADA HACIA EL NORTE", "NO, EN NINGÚN LUGAR EN PARTICULAR", "NO SE", "NINGUNA OPCIÓN"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 4,
		"Siguiente_incorrecta": 4,
		"Textura":-1
		},
		"Pregunta_5" : {
		"Pregunta": "¿ESTO SUCEDE DE LA MISMA MANERA  EN CUALQUIER LUGAR SOBRE LA TIERRA??",
		"Respuestas": ["SI", "NO", "NO SE"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 5,
		"Siguiente_incorrecta": 5,
		"Textura":-1
		}, 	
		"Pregunta_6" : {
		"Pregunta": "¿LA SOMBRA QUE HACEN LOS OBJETOS ILUMINADOS POR EL SOL, ES LA MISMA DURANTE TODO EL DÍA??",
		"Respuestas": ["SI", "NO", "NO SE"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 6,
		"Siguiente_incorrecta": 7,
		"Textura":-1
		},
		"Pregunta_7" : {
		"Pregunta": "¿Y CÓMO CAMBIAN ESAS SOMBRAS?",
		"Respuestas": ["AL MEDIODÍA ES MÁS LARGA Y A LA TARDE MÁS CORTA", "A LA MAÑANA TEMPRANO ES LARGA, AL MEDIODÍA ES MÁS CORTA Y DESPUÉS SE VUELVE A ALARGAR", "No se", "Ninguna opción"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 7,
		"Siguiente_incorrecta": 7,
		"Textura":-1
		},  
		"Pregunta_8" : {
		"Pregunta": "¿CONSIDERÁS  QUE LAS SOMBRAS QUE HACEN LOS OBJETOS AL MEDIODÍA TIENEN EL MISMO LARGO DURANTE TODO EL AÑO?",
		"Respuestas": ["SI", "NO", "NO SE"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 8,
		"Siguiente_incorrecta": 11,
		"Textura":-1
		},  
		"Pregunta_9" : {
		"Pregunta": "¿OBSERVANDO LA IMAGEN PODRÍAS DECIR A QUÉ ESTACIÓN DEL AÑO CORRESPONDEN??",
		"Respuestas": ["Primavera", "Otoño", "Invierno", "Verano"],
		"Respuesta_correcta": 2,
		"Siguiente_correcta": 9,
		"Siguiente_incorrecta": 9,
		"Textura":-1
		},  
		"Pregunta_10" : {
		"Pregunta": "¿OBSERVANDO LA IMAGEN PODRÍAS DECIR A QUÉ ESTACIÓN DEL AÑO CORRESPONDEN??",
		"Respuestas": ["Primavera", "Otoño", "Invierno", "Verano"],
		"Respuesta_correcta": 3,
		"Siguiente_correcta": 10,
		"Siguiente_incorrecta": 10,
		"Textura":-1
		},  
		"Pregunta_11" : {
		"Pregunta": "¿OBSERVANDO LA IMAGENE PODRÍAS DECIR A QUÉ ESTACIÓNES DEL AÑO CORRESPONDEN??",
		"Respuestas": ["Primavera/Otoño", "Invierno/Verano"],
		"Respuesta_correcta": 0,
		"Siguiente_correcta": 11,
		"Siguiente_incorrecta": 11,
		"Textura":-1
		},  
		"Pregunta_12" : {
		"Pregunta": "LA CANTIDAD DE HORAS EN LA QUE ES “DE DIA”, ¿ES LA MISMA A LO LARGO DE TODO EL AÑO?",
		"Respuestas": ["SI", "NO", "No se"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 12,
		"Siguiente_incorrecta": 12,
		"Textura":-1
		},  
		"Pregunta_13" : {
		"Pregunta": "¿POR QUÉ TE PARECE QUE EN VERANO LAS TEMPERATURAS SON MÁS ALTAS QUE EN INVIERNO??",
		"Respuestas": ["PORQUE LA TIERRA ESTÁ MÁS CERCA DEL SOL", "PORQUE HAY MÁS HORAS EN LA QUE ES “DE DÍA", "No se", "Ninguna opción"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 13,
		"Siguiente_incorrecta": 13,
		"Textura":-1
		},  
		"Pregunta_14" : {
		"Pregunta": "¿ACÁ, EN LA ARGENTINA,  EN NAVIDAD ESTAMOS EN VERANO. ¿POR QUÉ,  EN ALGUNOS LUGARES, EN NAVIDAD ES INVIERNO (ES CUANDO HACE MÁS FRÍO Y HASTA HAY NIEVE)?",
		"Respuestas": ["NO SE", "PORQUE EN ESOS LUGARES TODO EL AÑO HACE FRÍO", "PORQUE EN EL HEMISFERIO NORTE Y EL HEMISFERIO SUR SIEMPRE LAS ESTACIONES SON OPUESTAS"],
		"Respuesta_correcta": 2,
		"Siguiente_correcta": 14,
		"Siguiente_incorrecta": 14,
		"Textura":-1
		},  
		"Pregunta_15" : {
		"Pregunta": "¿POR DONDE SALE Y SE OCULTA EL SOL?",
		"Respuestas": ["SALE POR EL ESTE Y SE OCULTA POR EL OESTE", "DEPENDE DE LA ÉPOCA DEL AÑO", "No se", "Ninguna opcion"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 16,
		"Siguiente_incorrecta": 15,
		"Textura":-1
		},  
		"Pregunta_16" : {
		"Pregunta": "EN ESTAS FOTOS DE MONTE HERMOSO, SE PUEDE VER QUE EL SOL SALE Y  SE OCULTA EN EL MAR. ¿CÓMO PUEDE SUCEDER ESO SI EL SOL SALE POR EL ESTE Y SE OCULTA EN EL OESTE?",
		"Respuestas": ["NO SE", "NO TIENE SENTIDO", " PORQUE EL ESTE Y EL OESTE NO ESTÁN EN LADOS OPUESTOS", "PORQUE ESAS PLAYAS ESTÁN RODEADAS POR MAR"],
		"Respuesta_correcta": 3,
		"Siguiente_correcta": 16,
		"Siguiente_incorrecta": 16,
		"Textura":-1
		},  
		"Pregunta_17" : {
		"Pregunta": "ENTONCES, SI MIRÁS FOTOS DE MONTE HERMOSO DURANTE EL VERANO EN EL MOMENTO DEL  AMANECER Y DEL ATARDECER, Y RECORDANDO QUE  EL ESTE Y EL OESTE ESTÁN EN LADOS OPUESTOS, POR DÓNDE PODÉS DECIR QUE SALE EL SOL?",
		"Respuestas": ["POR EL SUDESTE", "NO SE", "POR EL ESTE", "NINGUNA OPCIÓN"],
		"Respuesta_correcta": 0,
		"Siguiente_correcta": 17,
		"Siguiente_incorrecta": 17,
		"Textura":-1
		},  
		"Pregunta_18" : {
		"Pregunta": "¿Y POR DONDE SE OCULTA?",
		"Respuestas": ["POR EL SUDOESTE", "NO SE", "POR EL OESTE", "NINGUNA OPCIÓN"],
		"Respuesta_correcta": 0,
		"Siguiente_correcta": 18,
		"Siguiente_incorrecta": 18,
		"Textura":-1
		},  
		"Pregunta_19" : {
		"Pregunta": "EN VERANO, EL SOL PERMANECE MÁS HORAS EN EL CIELO ¿PORQUE?",
		"Respuestas": ["SE MUEVE  MÁS LENTO", "LA TRAYECTORIA QUE HACE EN EL CIELO ES MÁS LARGA", "NO SE", "NINGUNA OPCIÓN"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 19,
		"Siguiente_incorrecta": 19,
		"Textura":-1
		},  
		"Pregunta_20" : {
		"Pregunta": "EN ESTE VIDEO LA CÁMARA ESTÁ APUNTANDO AL SOL A LO LARGO DE 24HS ¿CÓMO EXPLICARÍAS QUE EL SOL NUNCA QUEDA POR DEBAJO DEL HORIZONTE?",
		"Respuestas": ["ES UN TRUCO, NO ES REAL", "NO TIENE SENTIDO", "ESO SE VE CUANDO ESTÁS CERCA DE LOS POLOS", "NO SE"],
		"Respuesta_correcta": 2,
		"Siguiente_correcta": 20,
		"Siguiente_incorrecta": 20,
		"Textura":-1
		},  
	},
	"Astrologia":{
		"Pregunta_1" : {
		"Pregunta": "¿Sabes cuál es tu signo zodiacal (Aries, Tauro, Acuario, etc )?",
		"Respuestas": ["Si, conozco mi signo zodiacal ", "No, no lo conozco"],
		"Respuesta_correcta": 0,
		"Siguiente_correcta": 1,
		"Siguiente_incorrecta": 4,
		"Textura":-1
		},
		"Pregunta_2" : {
		"Pregunta": "¿Sabes cuál es la diferencia entre cada signo?",
		"Respuestas": ["No, no sé en qué se diferencia cada uno", "Cada signo se asocia a una de las constelaciones zodiacales y la posición del Sol, visto desde la TIERRA, en cada fecha", "Cada signo se asocia a una de las constelaciones zodiacales y la posición del Sol, visto desde la LUNA, en cada fecha.", "Cada signo corresponde a una diferente energía cósmica que depende del lugar y la fecha en que naciste."],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 3,
		"Siguiente_incorrecta": 2,
		"Textura":-1
		}, 
		"Pregunta_3" : {
		"Pregunta": "¿Qué crees que pasaría si cambias tu signo zodiacal por el mismo que un amigo tuyo?",
		"Respuestas": ["Nuestras actitudes serán similares ", "Nos pasarían cosas parecidas, tendríamos la misma suerte", "Eso no se puede, porque depende solo del día en el que nací y el lugar."],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 3,
		"Siguiente_incorrecta": 3,
		"Textura":-1
		}, 
		"Pregunta_4" : {
		"Pregunta": "Si te mudas a otro planeta, como por ejemplo a Marte ¿Piensas que allí los signos zodiacales serían otros?",
		"Respuestas": ["No tendría signo zodiacal en otro planeta que no sea la Tierra", "No, pero cada signo duraría distinto tiempo", "No, porque las constelaciones serían exactamente las mismas."],
		"Respuesta_correcta": 0,
		"Siguiente_correcta": 4,
		"Siguiente_incorrecta": 4,
		"Textura":-1
		},
		"Pregunta_5" : {
		"Pregunta": "¿Crees que existe alguna relación entre la posición de las estrellas o planetas con las cosas que te pasan?",
		"Respuestas": ["No, no existe ninguna relación.", "Si, lo dice el horóscopo"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 6,
		"Siguiente_incorrecta": 5,
		"Textura":-1
		}, 
		"Pregunta_6" : {
		"Pregunta": "¿Por qué razón piensas que el horóscopo dice lo correcto?",
		"Respuestas": ["Porque generalmente me pasa lo que dice el horóscopo.", "Porque se puede comprobar científicamente lo que dice", "Porque lo escuché o vi en algún lugar (televisión, internet, amigos o amigas, familiares).", "Algo que se publica todos los días en televisión o internet en todo el mundo tiene que ser real."],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 6,
		"Siguiente_incorrecta": 6,
		"Textura":-1
		},
		"Pregunta_7" : {
		"Pregunta": "¿Con qué modelo del universo estás de acuerdo?",
		"Respuestas": ["Uno con la Tierra en el centro y todos los demás planetas se mueven alrededor de ella", "Uno con el Sol como centro de nuestra galaxia y parte de un universo con miles más de ellas.", "Uno con el Sol en la región exterior de la galaxia", "Ninguna de las anteriores"],
		"Respuesta_correcta": 1,
		"Siguiente_correcta": 7,
		"Siguiente_incorrecta": 7,
		"Textura":-1
		}, 
	},
} 


func _ready() :
	_cargar_categoria("Tierra")
	_cargar_categoria("Tierra_Sol")
	_cargar_categoria("Astrologia")

func _cargar_categoria(var nombre:String) :	
	var categoria =_data[nombre]
	var cantidad_preguntas = categoria.size()
	for i in range(cantidad_preguntas):
		var indice = str(i+1)
		var nueva_pregunta:Pregunta = Pregunta.instance()
		var from_json = categoria["Pregunta_"+indice]
		var texto_pregunta = from_json["Pregunta"]
		var textos_respuestas= from_json["Respuestas"]
		var indice_correcta= from_json["Respuesta_correcta"]
		var textura= from_json["Textura"]
		nueva_pregunta.cargar(texto_pregunta,textos_respuestas,indice_correcta, textura)
		nueva_pregunta.siguiente_correcta = from_json["Siguiente_correcta"]
		nueva_pregunta.siguiente_incorrecta = from_json["Siguiente_incorrecta"]
#		nueva_pregunta.test()
		nueva_pregunta.numero_pregunta = i
		obtener_categoria(nombre).append(nueva_pregunta)
	categorias_cargadas.append(nombre)

func obtener_pregunta(var categoria:String,var pregunta:int) -> Pregunta:
	return obtener_categoria(categoria)[pregunta]

func obtener_categoria(var categoria:String):
	var result:Array
	match(categoria):
		"Tierra":
			result = Tierra
		"Tierra_Sol":
			result = Tierra_Sol
		"Astrologia":
			result = Astrologia
	return result

func cantidad_preguntas(var categoria:String) -> int:
	return obtener_categoria(categoria).size()
