@motorway:  #a8a19e;
@trunk:     @motorway;
@primary:   #c9c6bf;
@secondary: @primary;
@road:      #ccc;
@track:     @road;
@footway:   #ac9;
@cycleway:  #9ca;

//Color roads
//#F56544 motorway
//#FFC53C primary

//Grey roads
//#a8a19e motorway
//#c9c6bf primary

#osmroads::line {
 [zoom>=8][zoom<=12] {
    [fclass='motorway'] { line-color:@motorway; }
    [fclass='trunk'] { line-color:@trunk; }
    [fclass='motorway'],
    [fclass='trunk'] {
      line-cap:round;
      line-join:round;
      [zoom=11] { line-width:2; }
    }
  

  }
  [zoom>=12][zoom<=13] {
    [fclass='motorway_link'],
    [fclass='trunk_link'],
    [fclass='primary_link'],
    [fclass='secondary_link'],
    [fclass='tertiary'],
    [fclass='tertiary_link'],
    [fclass='unclassified'],
    [fclass='residential'],
    [fclass='living_street'] {
      line-color:@road;
      [zoom=12] { line-width:0.5; }
    }
  }
  [zoom>=14][zoom<=15] {
    [fclass='service'],
    [fclass='pedestrian'] {
      line-color:@road;
      [zoom=14] { line-width:0.5; }
    }
  }
  [zoom>=14] {
    [fclass='track'],
    [fclass='footway'],
    [fclass='bridleway'] {
      line-color:@footway;
      line-dasharray:4,1;
      line-cap:butt;
      [zoom=16] { line-width:1.2; }
      [zoom=17] { line-width:1.6; }
      [zoom>17] { line-width:2; }
    }
    [fclass='steps'] {
      line-color:@footway;
      line-dasharray:2,2;
      line-cap:butt;
      [zoom=16] { line-width:2; }
      [zoom=17] { line-width:3; }
      [zoom>17] { line-width:4; }
    }
    [fclass='cycleway'] {
      line-color: @cycleway;
      line-dasharray:4,1;
      line-cap:butt;
      [zoom=16] { line-width:1.2; }
      [zoom=17] { line-width:1.6; }
      [zoom>17] { line-width:2; }
    }
  }
}

#osmroads::case[zoom>=12][tunnel!=1][bridge!=1]{
  // -- line style --
  line-cap:round;
  line-join:round;
  line-width:0;
  [tunnel=1] {
    line-cap:butt;
    line-dasharray:6,3;
  }
  [bridge=1] { line-color:@road * 0.8; }
  // -- colors --
  line-color:@road;
  [fclass='motorway'],
  [fclass='motorway_link'] {
    line-color:@motorway;
    [bridge=1] { line-color:@motorway * 0.8; }
  }
  [fclass='trunk'],
  [fclass='trunk_link'] {
    line-color:@trunk;
    [bridge=1] { line-color:@trunk * 0.8; }
  }
  [fclass='primary'],
  [fclass='primary_link'] {
    line-color:@primary;
    [bridge=1] { line-color:@primary * 0.8; }
  }
  [fclass='secondary'],
  [fclass='secondary_link'] {
    line-color:@secondary;
    [bridge=1] { line-color:@secondary * 0.8; }
  }
  // -- widths --
  [fclass='motorway'],
  [fclass='trunk'] {
    [zoom=12] { line-width: 1.2 + 2; }
    [zoom=13] { line-width: 2 + 2; }
    [zoom=14] { line-width: 4 + 2; }
    [zoom=15] { line-width: 6 + 2; }
    [zoom=16] { line-width: 9 + 3; }
    [zoom=17] { line-width: 13 + 3; }
    [zoom>17] { line-width: 15 + 3; }
  }
  [fclass='primary'],
  [fclass='secondary'] {
    [zoom=12] { line-width: 1 + 2; }
    [zoom=13] { line-width: 1.2 + 2; }
    [zoom=14] { line-width: 2 + 2; }
    [zoom=15] { line-width: 4 + 2; }
    [zoom=16] { line-width: 7 + 3; }
    [zoom=17] { line-width: 9 + 3; }
    [zoom>17] { line-width: 11 + 3; }
  }
  [fclass='motorway_link'],
  [fclass='trunk_link'],
  [fclass='primary_link'],
  [fclass='secondary_link'],
  [fclass='tertiary'],
  [fclass='tertiary_link'],
  [fclass='unclassified'],
  [fclass='residential'],
  [fclass='living_street'] {
    [zoom=14] { line-width: 1.6 + 1.6; }
    [zoom=15] { line-width: 4 + 2; }
    [zoom=16] { line-width: 6 + 2; }
    [zoom=17] { line-width: 8 + 3; }
    [zoom>17] { line-width: 10 + 3; }
  }
  [fclass='service'],
  [fclass='pedestrian'] {
    [zoom=16] { line-width: 1.6 + 2; }
    [zoom=17] { line-width: 2 + 2; }
    [zoom>17] { line-width: 3 + 2.5; }
  }
}

#osmroads::fill[zoom>=13][tunnel!=1][bridge!=1] {
  // -- line style --
  line-cap:round;
  line-join:round;
  line-width:0;
  // -- colors --
  line-color:lighten(@road,20);
  [fclass='motorway'],
  [fclass='motorway_link'] {
    line-color:lighten(@motorway,10);
    [tunnel=1] { line-color:@motorway * 0.5 + rgb(127,127,127); }
  }
  [fclass='trunk'],
  [fclass='trunk_link'] {
    line-color:lighten(@trunk,10);
    [tunnel=1] { line-color:@trunk * 0.5 + rgb(127,127,127); }
  }
  [fclass='primary'],
  [fclass='primary_link'] {
    line-color:lighten(@primary,20);
    [tunnel=1] { line-color:@primary * 0.5 + rgb(127,127,127); }
  }
  [fclass='secondary'],
  [fclass='secondary_link'] {
    line-color:lighten(@secondary,20);
    [tunnel=1] { line-color:@secondary * 0.5 + rgb(127,127,127); }
  }
  // -- widths --
  [fclass='motorway'],
  [fclass='trunk'] {
    [zoom=12] { line-width: 1.2; }
    [zoom=13] { line-width: 2; }
    [zoom=14] { line-width: 4; }
    [zoom=15] { line-width: 6; }
    [zoom=16] { line-width: 9; }
    [zoom=17] { line-width: 13; }
    [zoom>17] { line-width: 15; }
  }
  [fclass='primary'],
  [fclass='secondary'] {
    [zoom=12] { line-width: 1; }
    [zoom=13] { line-width: 1.2; }
    [zoom=14] { line-width: 2; }
    [zoom=15] { line-width: 4; }
    [zoom=16] { line-width: 7; }
    [zoom=17] { line-width: 9; }
    [zoom>17] { line-width: 11; }
  }
  [fclass='motorway_link'],
  [fclass='trunk_link'],
  [fclass='primary_link'],
  [fclass='secondary_link'],
  [fclass='tertiary'],
  [fclass='tertiary_link'],
  [fclass='unclassified'],
  [fclass='residential'],
  [fclass='living_street'] {
    [zoom=14] { line-width: 1.6; }
    [zoom=15] { line-width: 4; }
    [zoom=16] { line-width: 6; }
    [zoom=17] { line-width: 8; }
    [zoom>17] { line-width: 10; }
  }
  [fclass='service'],
  [fclass='pedestrian'] {
    [zoom=16] { line-width: 1.6; }
    [zoom=17] { line-width: 2; }
    [zoom>17] { line-width: 3; }
  }
}

/* ---- ONE WAY ARROWS ---- */

/* ---- ONE WAY ARROWS ---- */

#osmroads-label::oneway_arrow[zoom>15][oneway=1] {
  marker-file:url("shape://arrow");
  marker-width:15;
  marker-placement:line;
  marker-line-width:1;
  marker-line-opacity:0.5;
  marker-line-color:#fff;
  marker-spacing: 200;
  marker-fill:spin(darken(@motorway,50),-10);
  marker-opacity:0.8;
}








