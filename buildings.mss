@building-fill: #d9d0c9; //Lch(84, 5, 70)
@building-line: darken(@building-fill, 15%);
@building-low-zoom: darken(@building-fill, 4%);

@building-major-fill: darken(@building-fill, 20%);
@building-major-line: darken(@building-major-fill, 25%);

@entrance-accessible: darken(@building-line, 15%);
@entrance-normal: @building-line;
@entrance-noaccess: lighten(@building-line, 10%);

#buildings {
  [zoom >= 13] {
    polygon-fill: @building-low-zoom;
    polygon-clip: false;
    [zoom >= 15] {
      line-color: @building-line;
      polygon-fill: @building-fill;
      line-width: .75;
      line-clip: false;
    }
  }
}

#buildings-major {
  [zoom >= 13] {
    [aeroway = 'terminal'],
    [amenity = 'place_of_worship'],
    [building = 'train_station'],
    [aerialway = 'station'],
    [public_transport = 'station'] {
      polygon-fill: @building-major-fill;
      polygon-clip: false;
      [zoom >= 15] {
        line-width: .75;
        line-clip: false;
        line-color: @building-major-line;
      }
    }
  }
}

#bridge {
  [zoom >= 12] {
    polygon-fill: #B8B8B8;
  }
}

#entrances {
  ["entrance" != null] {
    marker-fill: @entrance-normal;
    marker-line-color: @entrance-normal;
    marker-line-opacity: 0.0;
    marker-allow-overlap: true;
    marker-ignore-placement: true;
    ["entrance" = "main"] {
      marker-file: url('symbols/square.svg');
      marker-fill: @entrance-accessible;
    }
    ["entrance" = "staircase"] {
      marker-file: url('symbols/square.svg');
    }
    ["entrance" = "service"] {
      marker-fill: @building-fill;
      marker-line-opacity: 1.0;
      marker-line-width: 0.75;
      [zoom < 18] {
        marker-opacity: 0.0;
      }
    }
    ["entrance" = "exit"],["entrance" = "emergency"] {
      marker-opacity: 0.0;
    }
    ["access" = "yes"],["access" = "permissive"] {
      marker-fill: @entrance-accessible;
      marker-line-color: @entrance-accessible;
    }
    ["access" = "no"] {
      marker-fill: @entrance-noaccess;
      marker-line-color: @entrance-noaccess;
    }
    [zoom >= 17] {
      marker-width: 3.5;
      marker-height: 3.5;
    }
    [zoom >= 18] {
      marker-width: 5;
      marker-height: 5;
    }
    [zoom >= 19] {
      marker-width: 6.5;
      marker-height: 6.5;
    }
    [zoom >= 20] {
      marker-width: 8;
      marker-height: 8;
    }
  }
}
