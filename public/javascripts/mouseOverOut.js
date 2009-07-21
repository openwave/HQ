if (document.images) {
    bulletedListup       = new Image();
    bulletedListup.src   = "/images/templateBulletedList.jpg" ;
    bulletedListdown     = new Image() ;
    bulletedListdown.src = "/images/templateBulletedListOver.jpg" ;

    priceDescriptionup       = new Image();
    priceDescriptionup.src   = "/images/templatePriceDescription.jpg" ;
    priceDescriptiondown     = new Image() ;
    priceDescriptiondown.src = "/images/templatePriceDescriptionOver.jpg" ;

    flowingTextup       = new Image();
    flowingTextup.src   = "/images/templateFlowingText.jpg" ;
    flowingTextdown     = new Image() ;
    flowingTextdown.src = "/images/templateFlowingTextOver.jpg" ;
}
function buttondown( buttonname )
{
    if (document.images) {
      document[ buttonname ].src = eval( buttonname + "down.src" );
    }
}
function buttonup ( buttonname )
{
    if (document.images) {
      document[ buttonname ].src = eval( buttonname + "up.src" );
    }
}
