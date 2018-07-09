@font_reg: "Ubuntu Regular","DejaVu Sans Book";

/* ---- HIGHWAY ---- */

#osmroads-label {
  text-face-name:@font_reg;
  text-halo-radius:1;
  text-placement:line;
  text-name:"''";
  [fclass='motorway'][zoom>=13] {
    text-name:"[name]";
    text-fill:spin(darken(@motorway,50),-15);
    text-halo-fill:lighten(@motorway,15);
    [zoom>=13] { text-size:11; }
    [zoom>=15] { text-size:12; }
  }
  [fclass='trunk'][zoom>=13] {
    text-name:"[name]";
    text-fill:spin(darken(@trunk,50),-15);
    text-halo-fill:lighten(@trunk,15);
    [zoom>=15] { text-size:11; }
  }
  [fclass='primary'][zoom>=15] {
    text-name:"[name]";
    text-fill:spin(darken(@primary,50),-15);
    text-halo-fill:lighten(@primary,15);
    [zoom>=15] { text-size:11; }
    [zoom>=15] { text-size:12; }
  }
  [fclass='secondary'][zoom>=15] {
    text-name:"[name]";
    text-fill:spin(darken(@secondary,50),-15);
    text-halo-fill:lighten(@secondary,15);
    [zoom>=15] { text-size:11; }
  }
  [fclass='residential'][zoom>=16],
  [fclass='road'][zoom>=16],
  [fclass='tertiary'][zoom>=16],
  [fclass='unclassified'][zoom>=16] {
    text-name:"[name]";
    text-fill:#444;
    text-halo-fill:#fff;
  }
}

/* ---- LOCATION ---- */

#osmplaces[fclass='town'][zoom>=11][zoom<17] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#444;
  text-halo-fill:rgba(255,255,255,0.8);
  text-halo-radius:2;
  text-transform:uppercase;
  text-size:9;
  [zoom=11] {
    text-size:10;
    text-character-spacing:1;
  }
  [zoom=12] {
    text-size:11;
    text-character-spacing:2;
  }
  [zoom=13] {
    text-size:13;
    text-character-spacing:2.5;
  }
  [zoom=14] {
    text-size:14;
    text-character-spacing:2.5;
  }
  [zoom=15] {
    text-size:14;
    text-character-spacing:3;
  }
}

#osmplaces[fclass='city'][zoom>=8][zoom<15] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#444;
  text-halo-fill:rgba(255,255,255,0.8);
  text-halo-radius:2;
  text-transform:uppercase;
  [zoom=8] {
    text-size:8;
    text-character-spacing:0.2;
  }
  [zoom=9] {
    text-size:11;
    text-character-spacing:0.5;
  }
  [zoom=10] {
    text-size:11;
    text-character-spacing:1.5;
  } 
  [zoom=11] {
    text-size:12;
    text-character-spacing:1.5;
  }
  [zoom=12] {
    text-size:14;
    text-character-spacing:1.5;
  }
  [zoom=13] {
    text-size:16;
    text-character-spacing:2;
  }
  [zoom=14] {
    text-size:16;
    text-character-spacing:2.5;
  }
}

#osmplaces[fclass='hamlet'][zoom>13][zoom<17],
#osmplaces[fclass='village'][zoom>13][zoom<17],
#osmplaces[fclass='neighbourhood'][zoom>14][zoom<17] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#555;
  text-halo-fill:rgba(255,255,255,0.8);
  text-halo-radius:2;
  text-wrap-width:100;
  text-wrap-before:true;
  [zoom=14] {
    text-size:12;
    text-character-spacing:0.5;
    text-wrap-width:30;
    text-line-spacing:0.5;
  }
  [zoom=15] {
    text-size:13;
    text-character-spacing:1;
    text-wrap-width:50;
    text-line-spacing:1;
  }
  [zoom=16] {
    text-size:14;
    text-character-spacing:2;
    text-wrap-width:80;
    text-line-spacing:2;
  }
  [zoom=17] {
    text-size:15;
    text-character-spacing:4;
    text-wrap-width:100;
    text-line-spacing:4;
  }
  [zoom=18] {
    text-size:15;
    text-character-spacing:4;
    text-wrap-width:100;
    text-line-spacing:4;
  }
}

#nederland-label[NAME='Netherlands'][zoom>3][zoom<8] {
  text-face-name:@font_reg;
  text-name:"[NAME]";
  text-fill:#444;
  text-halo-fill:rgba(255,255,255,0.8);
  text-halo-radius:2;
  text-transform:uppercase;
  [zoom=3] {
    text-size:3;
    text-character-spacing:0.5;
  }
  [zoom=4] {
    text-size:4;
    text-character-spacing:0.5;
  }
  [zoom=5] {
    text-size:6;
    text-character-spacing:1;
  }
  [zoom=6] {
    text-size:10;
    text-character-spacing:2;
  }
   [zoom=7] {
    text-size:12;
    text-character-spacing:3;
  }
}
