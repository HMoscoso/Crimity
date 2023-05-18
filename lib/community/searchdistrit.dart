import 'package:crimityapp/community/distrit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class SearchCommunityScreen extends StatefulWidget {
  const SearchCommunityScreen({ Key? key }) : super(key: key);

  @override
  _SearchCommunityScreen createState() => _SearchCommunityScreen();
}

class _SearchCommunityScreen extends State<SearchCommunityScreen> {

  List<Distrito> _distritos = [
    Distrito('Comunidad Ancón', '@Distrito de Lima', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/24/f2/84/se-fue-extendiendo-hasta.jpg?w=1200&h=1200&s=1', false),
    Distrito('Comunidad Ate Vitarte', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Municipalidad_de_Ate.jpg', false),
    Distrito('Comunidad Barranco', '@Distrito de Lima', 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/90000/90220-Barranco.jpg', false),
    Distrito('Comunidad Breña', '@Distrito de Lima', 'https://adiperu.pe/wp-content/uploads/Viviendas-Bre%C3%B1a-01.jpg', false),
    Distrito('Comunidad Carabayllo', '@Distrito de Lima', 'https://www.munlima.gob.pe/images/2016_Fotos_Notas_Web_MML/PisCaraUno.JPG', false),
    Distrito('Comunidad Chaclacayo', '@Distrito de Lima', 'https://enlima.pe/sites/default/files/chaclacayo.jpg', false),
    Distrito('Comunidad Chorrillos', '@Distrito de Lima', 'https://media.licdn.com/dms/image/C5612AQENjt4sKNDREQ/article-cover_image-shrink_720_1280/0/1625696868449?e=2147483647&v=beta&t=wwVzhgHcEU6VijCU7MGs5EXDibnsPXQQqxdoOI6x2Yg', false),
    Distrito('Comunidad Cieneguilla', '@Distrito de Lima', 'https://elcomercio.pe/resizer/CjEUsNZuw9ZXC5GQw4AbUvu19ZE=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/YXIVOOMBQZF2VGV65SYQXVXWLQ.jpg', false),
    Distrito('Comunidad Comas', '@Distrito de Lima', 'https://larazon.pe/wp-content/uploads/2021/09/000808471W.jpg', false),
    Distrito('Comunidad El Agustino', '@Distrito de Lima', 'https://mdea.gob.pe/beta/wp-content/uploads/2020/11/CERRO-DE-CATALINA-HUANCA.jpg', false),
    Distrito('Comunidad Independencia', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Municipalidad_de_Independencia_Lima.jpg', false),
    Distrito('Comunidad Jesús María', '@Distrito de Lima', 'https://www.triada.com.pe/noticias/wp-content/uploads/2019/12/triada-boom-inmobiliario-jesus-maria-1210x6661-2-1210x666.jpg', false),
    Distrito('Comunidad La Molina', '@Distrito de Lima', 'https://blog.properati.com.pe/wp-content/uploads/2022/12/la-molina-distrito-lima-properati-1.jpg', false),
    Distrito('Comunidad La Victoria', '@Distrito de Lima', 'https://elcomercio.pe/resizer/serSn8RNPxkgLlfSZWj2rUZXeJI=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/IWTXS2NLWJHLFJCLONVJ4YCFTU.jpg', false),
    Distrito('Comunidad Lima', '@Distrito de Lima', 'https://www.lima2019.pe/sites/default/files/2019-07/iStock-458584553.jpg', false),
    Distrito('Comunidad Lince', '@Distrito de Lima', 'https://photos.wikimapia.org/p/00/00/40/23/47_big.jpg', false),
    Distrito('Comunidad Los Olivos', '@Distrito de Lima', 'https://blog.properati.com.pe/wp-content/uploads/2022/12/los-olivos-distrito-lima-properati-1.jpg', false),
    Distrito('Comunidad Lurigancho', '@Distrito de Lima', 'https://noticias-pe.laiglesiadejesucristo.org/media/960x540/SJ-Lurigancho-1.jpg', false),
    Distrito('Comunidad Lurín', '@Distrito de Lima', 'https://gestion.pe/resizer/fIlsvBz1l9XdMkwpqJD3_MtwlRI=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/PMSIARK3VVHTTBZPN2SFBJUVE4.jpg', false),
    Distrito('Comunidad Magdalena del Mar', '@Distrito de Lima', 'https://blog.properati.com.pe/wp-content/uploads/2021/06/Captura-de-pantalla-2021-06-18-a-las-17.30.47.png', false),
    Distrito('Comunidad Miraflores', '@Distrito de Lima', 'https://www.peruforless.com/blog/wp-content/uploads/2022/10/top-picture-2.jpg', false),
    Distrito('Comunidad Pachacamac', '@Distrito de Lima', 'https://viajandoalima.com/wp-content/uploads/2017/12/Pachacamac-Lima.jpg', false),
    Distrito('Comunidad Pucusana', '@Distrito de Lima', 'https://i.pinimg.com/originals/76/f7/fe/76f7fef6b602374e5e3a88067772dc1c.jpg', false),
    Distrito('Comunidad Pueblo Libre', '@Distrito de Lima', 'https://antiguatabernaqueirolo.com/wp-content/uploads/2018/09/un-paseo-por-pueblo-libre.jpg', false),
    Distrito('Comunidad Puente Piedra', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/4/43/Puentepiedra3.jpg', false),
    Distrito('Comunidad Punta Hermosa', '@Distrito de Lima', 'https://gestion.pe/resizer/GGdb48vTWXHVzMhHznO6UaY6ezY=/980x528/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/YJFXSIZYLBE2BGAMYOWO7T4GJU.jpeg', false),
    Distrito('Comunidad Punta Negra', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/2/24/Vista_de_la_playa_desde_el_chanque.jpg', false),
    Distrito('Comunidad Rímac', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Vista_tarde_-noche_del_Paseo_de_Aguas.jpg', false),
    Distrito('Comunidad San Bartolo', '@Distrito de Lima', 'https://grupoctagon.com/blog/wp-content/uploads/2022/07/Miramar_proyecto_san_bartolo_distrito_playa_actividades_feriado-1000x700.jpg', false),
    Distrito('Comunidad San Borja', '@Distrito de Lima', 'https://blog.nexoinmobiliario.pe/wp-content/uploads/2021/04/san-borja-mejores-lugares-vivir-lima.jpg', false),
    Distrito('Comunidad San Isidro', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/f/f4/San_Isidro%2C_Lima%2C_Peru_-_Torre_Begonias.jpg', false),
    Distrito('Comunidad San Juan de Lurigancho', '@Distrito de Lima', 'https://medialab.unmsm.edu.pe/chiqaqnews/wp-content/uploads/2021/06/lurigancho-fot%C3%B3grafo-Ram%C3%B3n-Fern%C3%A1ndez.png', false),
    Distrito('Comunidad San Juan de Miraflores', '@Distrito de Lima', 'https://peru21.pe/resizer/VMir42g9ZL7PTYB4MDj_jUmLdSE=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/ENKF2UPM3RC2TOFMIQKRQ6NYZU.jpg', false),
    Distrito('Comunidad San Luis', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/4/45/MINISTRA_DE_DEFENSA_SOBREVOL%C3%93_LA_CAPITAL_PARA_SUPERVISAR_ACATAMIENTO_DE_INMOVILIZACI%C3%93N_SOCIAL_%2850898752783%29.jpg', false),
    Distrito('Comunidad San Martín de Porres', '@Distrito de Lima', 'https://noticias-pe.laiglesiadejesucristo.org/media/960x540/SMP-Plaza-Armas.jpg', false),
    Distrito('Comunidad San Miguel', '@Distrito de Lima', 'https://www.palmettohoteles.com/app/uploads/sites/179/san_miguel_home_02_lima.jpg', false),
    Distrito('Comunidad Santa Anita', '@Distrito de Lima', 'https://2.bp.blogspot.com/-shyST107K_k/WyKoM0HLC5I/AAAAAAAAL1M/1OS5W42hZeojba_h38LQsGlF-QcHV8OIACLcBGAs/s1600/foto+Santa+Anita+02.jpg', false),
    Distrito('Comunidad Santa María del Mar', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/0/05/Santa_Mar%C3%ADa_del_Mar_2.JPG', false),
    Distrito('Comunidad Santa Rosa', '@Distrito de Lima', 'https://4.bp.blogspot.com/-8rUXHymHuOg/WzFLBpuAnfI/AAAAAAAAL9Q/HCGNFAKqTREnJf7Mp73tp-L85EegKyPhACLcBGAs/s1600/foto+santa+rosa+01.jpg', false),
    Distrito('Comunidad Santiago de Surco', '@Distrito de Lima', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/04/2c/a1/92/surco.jpg?w=1200&h=-1&s=1', false),
    Distrito('Comunidad Surquillo', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Parque_Heroes_de_la_Paz_Surquillo.png', false),
    Distrito('Comunidad Villa El Salvador', '@Distrito de Lima', 'https://upload.wikimedia.org/wikipedia/commons/e/ed/Villa_Panamericana_de_Lima.jpg', false),
    Distrito('Comunidad Villa María del Triunfo', '@Distrito de Lima', 'https://www.religiondigital.org/2020/02/09/diario_de_un_cura_de_pueblo/Villa-Maria-Triunfo-Lima-Sur_2202989681_14313917_660x371.jpg', false),
  ];

  List<Distrito> _foundedDistrits = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedDistrits = _distritos;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedDistrits = _distritos.where((distrito) => distrito.name.toLowerCase().contains(search)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white70
                ),
                hintText: "Buscar distrito"
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: _foundedDistrits.length > 0 ? ListView.builder(
            itemCount: _foundedDistrits.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: distritComponent(distrito: _foundedDistrits[index]),
                actions: <Widget>[
                  new IconSlideAction(
                    caption: 'Share',
                    color: Colors.black87,
                    icon: Icons.share,
                    onTap: () => print('Share'),
                  ),
                ],
                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'More',
                    color: Colors.black87,
                    icon: Icons.more_horiz,
                    onTap: () => print('More'),
                  ),
                ],
              );
            }) : Center(child: Text("No users found", style: TextStyle(color: Colors.white),)),
      ),
    );
  }

  distritComponent({required Distrito distrito}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(distrito.image, fit: BoxFit.cover),
                    )
                ),
                SizedBox(width: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 150,child: Text(distrito.name, style: TextStyle(fontWeight: FontWeight.w500)),),
                      SizedBox(height: 5,),
                      Text(distrito.cantidad, style: TextStyle(color: Colors.grey[500])),
                    ]
                )
              ]
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                distrito.isFollowedByMe = !distrito.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: distrito.isFollowedByMe ? Color(0xFFFFD700) : Color(0xffffff),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: distrito.isFollowedByMe ? Colors.transparent : Colors.grey.shade700,)
                ),
                child: Center(
                    child: Text(distrito.isFollowedByMe ? 'Miembro' : 'Unirte al Grupo', style: TextStyle(color: distrito.isFollowedByMe ? Colors.white : Colors.black))
                )
            ),
          )
        ],
      ),
    );
  }
}