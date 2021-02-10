import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flutter/material.dart';

class DrumPhysicRender {
  final double ppm;

  DrumPhysicRender({this.ppm});

  renderBody(Canvas canvas, Body body) {
    if (body == null) return;
    double angle = body.getAngle();
    Vector2 position = body.position * ppm;
    Color color = body.userData as Color;
    Matrix4 matrix4 = Matrix4.identity()
      ..leftTranslate(position.x, position.y)
      ..rotateZ(angle);
    canvas.save();
    canvas.transform(matrix4.storage);

    for(Fixture f = body.getFixtureList(); f!= null; f= f.getNext())
      {
       if(f.getType() == ShapeType.CIRCLE){
         _drawCircle(canvas,f.getShape(),color);
       }else if(f.getType() == ShapeType.POLYGON){
         _drawPoly(canvas,f.getShape(),color);
       }else if(f.getType() == ShapeType.CHAIN){
        _drawChain(canvas, f.getShape(), color);
       }
      }
    canvas.restore();
  }

  _drawCircle(Canvas canvas , CircleShape circleShape , Color color){
    canvas.drawCircle(Offset(circleShape.p.x, circleShape.p.y),
        circleShape.radius * ppm,
        Paint()..style = PaintingStyle.fill..color = color != null ? color : Colors.amber
    );
  }
  _drawPoly(Canvas canvas , PolygonShape polygonShape , Color color){
    int vertixCount =  polygonShape.getVertexCount();
    List<Offset> points = [];
    for(int i = 0; i< vertixCount; i++)
      {
        Vector2 vector2 = polygonShape.getVertex(i) * ppm;
        points.add(Offset(vector2.x,vector2.y));

      }
   canvas.drawRect(
       Rect.fromLTRB(
           points[0].dx,
           points[2].dy,
           points[2].dx,
           points[0].dy,
       ), Paint()..strokeWidth = 1..style = PaintingStyle.fill..color = color != null ?  color:Colors.blue);
  }

  _drawChain(Canvas canvas , ChainShape chainShape , Color color){
    int vertixCount =  chainShape.getVertexCount();
    List<Offset> points = [];
    for(int i = 0; i< vertixCount; i++)
    {
      Vector2 vector2 = chainShape.getVertex(i) * ppm;
      points.add(Offset(vector2.x,vector2.y));

    }
    canvas.drawPoints(PointMode.lines, points, Paint()..strokeWidth = 1..style = PaintingStyle.fill..color = color != null ? color : Colors.green
    );
  }
}
