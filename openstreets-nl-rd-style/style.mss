/*
Amersfoort RD NEW EPSG 28992 !!
+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +no_defs 
*/

Map {
  background-color:#bfd8ff;
}

@water:#bfd8ff;
@park:#cea;
@land:#f0f0f0;
@school:#f8e8c8;


#airports[zoom>10] {
  line-color:#c9c6bf;
  line-width:0.5;
  polygon-opacity:0.5;
  polygon-fill:#ccc;
  [zoom<13] { polygon-opacity:0.1; }
}

#osmrailways[zoom>10] {
  line-color:#a8a19e;
  line-dasharray: 1, 1.5;
    [zoom=11] { line-width: 0.2; }
    [zoom=12] { line-width: 0.3; }
    [zoom=13] { line-width: 1; }
    [zoom=14] { line-width: 1.5; }
    [zoom=15] { line-width: 2; }
    [zoom=16] { line-width: 3; }
}


#osmlanduse[zoom>=8] {
  [fclass='forest'],
  [fclass='wood'] {
    polygon-fill:@park;
    polygon-pattern-file:url(images/wood.png);
    polygon-pattern-comp-op:multiply;
  }
  [fclass='cemetery'],
  [fclass='common'],
  [fclass='golf_course'],
  [fclass='park'],
  [fclass='pitch'],
  [fclass='recreation_ground'],
  [fclass='village_green'] {
    polygon-fill:@park;
  }
}

#osmlanduse[zoom>=12] {
  [fclass='school'],
  [fclass='college'],
  [fclass='university'] {
    polygon-fill: @school;
  }
}

#osmwater[zoom>=8] {
  polygon-fill:@water;
  polygon-gamma:0.5; // reduces gaps between shapes
}

#osmnl[zoom>=8] {
  polygon-opacity:1;
  polygon-fill:#fafaf8;
}

#osmnlboundary [zoom>=8] {
  line-color: #ccc;
  line-opacity: 0.7;
  line-width: 1;
  line-dasharray: 10, 3, 2, 3;
}

#nederland[zoom>=1][zoom<8] {
  line-color:#000;
  line-width:1;
  line-opacity:0.5;
  polygon-opacity:1;
  polygon-fill:#fafaf8;
  [zoom<3] {line-opacity:0.2; polygon-fill:#d9d9d9; }
  [zoom<=1] {polygon-fill:#bdbdbd; }
}

#countries {
  ::outline {
    line-color: #abc2e5;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #f0f0f0;
}



