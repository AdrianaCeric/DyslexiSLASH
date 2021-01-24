import 'dart:math';

import 'package:flutter/material.dart';

import 'models/tile.dart';
import 'models/tile_part.dart';
import 'models/touch_slice.dart';
import 'slice_painter.dart';

class CanvasAreaFast extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CanvasAreaFastState();
  }
}

class _CanvasAreaFastState<CanvasAreaFast> extends State {
  int score = 0;
  TouchSlice touchSlice;
  List<Tile> tiles = List();
  List<TilePart> tileParts = List();
  var imagePath = [
    "assets/J.png",
    "assets/M.png",
    "assets/R.png",
    "assets/S.png",
    "assets/S1.png",
    "assets/Z.png",
    "assets/Z1.png",
  ];
  var _random = Random();
  var imageToShow;
  @override
  void initState() {
    _spawnRandomTile();

    _tick();

    super.initState();
  }

  void _spawnRandomTile() {
    tiles.add(new Tile(
        position: Offset(
          0,
          0,
        ),
        width: 80,
        height: 80,
        additionalForce:
            Offset(3 + Random().nextDouble() * 5, Random().nextDouble() * -10),
        rotation: Random().nextDouble() / 3 - 0.16));
  }

  void _tick() {
    setState(() {
      for (Tile tile in tiles) {
        tile.applyGravity();
      }
      for (TilePart tilePart in tileParts) {
        tilePart.applyGravity();
      }

      if (Random().nextDouble() > 0.97) {
        _spawnRandomTile();
      }
    });

    Future.delayed(Duration(milliseconds: 30), _tick);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: _getStack());
  }

  List<Widget> _getStack() {
    List<Widget> widgetsOnStack = List();

    widgetsOnStack.add(_getBackground());
    widgetsOnStack.add(_getSlice());
    widgetsOnStack.addAll(_getTileParts());
    widgetsOnStack.addAll(_getTiles());
    widgetsOnStack.add(_getGestureDetector());
    widgetsOnStack.add(Positioned(
        right: 16,
        top: 16,
        child: Text(
          'Score: $score',
          style: TextStyle(fontSize: 24),
        )));

    return widgetsOnStack;
  }

  Container _getBackground() {
    return Container(
      color: Color(0xff7ccccc),
    );
  }

  Widget _getSlice() {
    if (touchSlice == null) {
      return Container();
    }

    return CustomPaint(
        size: Size.infinite,
        painter: SlicePainter(
          pointsList: touchSlice.pointsList,
        ));
  }

  List<Widget> _getTiles() {
    List<Widget> list = new List();

    for (Tile tile in tiles) {
      list.add(Positioned(
          top: tile.position.dy,
          left: tile.position.dx,
          child: Transform.rotate(
              angle: tile.rotation * pi * 2, child: _getMelon(tile))));
    }

    return list;
  }

  List<Widget> _getTileParts() {
    List<Widget> list = new List();

    for (TilePart tilePart in tileParts) {
      list.add(Positioned(
          top: tilePart.position.dy,
          left: tilePart.position.dx,
          child: _getMelonCut(tilePart)));
    }

    return list;
  }

  Widget _getMelonCut(TilePart tilePart) {
    return Transform.rotate(
        angle: tilePart.rotation * pi * 2,
        child: Image.asset(
            tilePart.isLeft ? 'assets/Cut.png' : 'assets/Cut_Right.png',
            height: 80,
            fit: BoxFit.fitHeight));
  }

  Widget _getMelon(Tile tile) {
    return Image.asset(imageToShow.toString(),
        height: 80, fit: BoxFit.fitHeight);
  }

  Widget _getGestureDetector() {
    return GestureDetector(onScaleStart: (details) {
      setState(() {
        _setNewSlice(details);
      });
    }, onScaleUpdate: (details) {
      setState(() {
        _addPointToSlice(details);

        _checkCollision();
      });
    }, onScaleEnd: (details) {
      setState(() {
        _resetSlice();
        imageToShow = imagePath[_random.nextInt(imagePath.length)];
      });
    });
  }

  _checkCollision() {
    if (touchSlice == null) {
      return;
    }

    for (Tile tile in List.from(tiles)) {
      bool firstPointOutside = false;
      bool secondPointInside = false;

      for (Offset point in touchSlice.pointsList) {
        if (!firstPointOutside && !tile.isPointInside(point)) {
          firstPointOutside = true;
          continue;
        }

        if (firstPointOutside && tile.isPointInside(point)) {
          secondPointInside = true;
          continue;
        }

        if (secondPointInside && !tile.isPointInside(point)) {
          tiles.remove(tile);
          _turnTileIntoParts(tile);
          score += 10;

          break;
        }
      }
    }
  }

  void _turnTileIntoParts(Tile hit) {
    TilePart leftTilePart = TilePart(
        position: Offset(hit.position.dx - hit.width / 8, hit.position.dy),
        width: hit.width / 2,
        height: hit.height,
        isLeft: true,
        gravitySpeed: hit.gravitySpeed,
        additionalForce:
            Offset(hit.additionalForce.dx - 1, hit.additionalForce.dy - 5),
        rotation: hit.rotation);

    TilePart rightTilePart = TilePart(
        position: Offset(
            hit.position.dx + hit.width / 4 + hit.width / 8, hit.position.dy),
        width: hit.width / 2,
        height: hit.height,
        isLeft: false,
        gravitySpeed: hit.gravitySpeed,
        additionalForce:
            Offset(hit.additionalForce.dx + 1, hit.additionalForce.dy - 5),
        rotation: hit.rotation);

    setState(() {
      tileParts.add(leftTilePart);
      tileParts.add(rightTilePart);
      tiles.remove(hit);
    });
  }

  void _resetSlice() {
    touchSlice = null;
  }

  void _setNewSlice(details) {
    touchSlice = TouchSlice(pointsList: [details.localFocalPoint]);
  }

  void _addPointToSlice(ScaleUpdateDetails details) {
    if (touchSlice.pointsList.length > 16) {
      touchSlice.pointsList.removeAt(0);
    }
    touchSlice.pointsList.add(details.localFocalPoint);
  }
}
