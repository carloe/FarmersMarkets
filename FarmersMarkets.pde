// Create by Carlo Eugster on 05/03/14
// https://github.com/carloe/FarmersMarkets

float mapGeoLeft   = -130;
float mapGeoRight  =  -63;
float mapGeoTop    =   50;
float mapGeoBottom =  22;

int offsetX = 2;
int offsetY = 3;

float mapScreenWidth,mapScreenHeight;
Table table;

void setup()
{
  size(800,530, P2D);
  noLoop();
  mapScreenWidth  = width;
  mapScreenHeight = height;
  table = loadTable("data/data.csv");
}

void draw() {
  background(0);

  stroke(255,10,10);
  blendMode(ADD);
  for (TableRow row : table.rows()) {
    PVector p = geoToPixel(new PVector(row.getFloat(offsetX),row.getFloat(offsetY)));
    for(int i=0;i<6;i++)
      point(p.x, p.y);
  }
}

public PVector pixelToGeo(PVector screenLocation) {
  return new PVector(mapGeoLeft + (mapGeoRight-mapGeoLeft)*(screenLocation.x)/mapScreenWidth,
   mapGeoTop - (mapGeoTop-mapGeoBottom)*(screenLocation.y)/mapScreenHeight);
}

public PVector geoToPixel(PVector geoLocation) {
  return new PVector(mapScreenWidth*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft),
   mapScreenHeight - mapScreenHeight*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}