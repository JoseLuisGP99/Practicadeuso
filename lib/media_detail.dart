import 'package:flutter/material.dart';
import 'package:movieapp_170755/model/Media.dart';
import 'dart:ui' as ui;

class MediaDetail extends StatelessWidget {
  final Media media;
  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: new Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          new SingleChildScrollView(
            child: new Container(
              margin: const EdgeInsets.all(20.0),
              child: new Column(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    child: new Container(
                      width: 390.0,
                      height: 390.0,
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: new DecorationImage(
                            image: new NetworkImage(media.getPosterUrl())),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: new Offset(0.0, 10.0))
                        ]),
                  ),
                  SizedBox(height: 20.0),
                  new Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Text(
                              media.title,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontFamily: 'silver'),
                            ),
                          ),
                          new Text(
                            '${media.voteAverage.toString()}/10',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'silver'),
                          )
                        ],
                      )),
                  new Column(
                    children: <Widget>[
                      new Text(
                        media.overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily:
                                'silver'), // Añade esta línea para justificar el texto
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
