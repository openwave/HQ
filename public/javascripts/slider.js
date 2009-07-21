 function transslide(highid) {
  var high='high_'+highid;
  Obcur=jQuery("#"+high)
  OPrev=jQuery("#"+high).prev()
  OPrev.slideUp()
  var temp;
  temp = Obcur.html()
  Obcur.html(OPrev.html())
  OPrev.html(temp)
  var sid;

  sid= Obcur.attr("id")
  Obcur.attr("id",OPrev.attr("id"));
  OPrev.attr("id",sid);
  OPrev.slideDown("slow")
  Obcur.append();
  OPrev.append();
  }


  function transslide1(highid) {
  var high='high_'+highid;
  if(jQuery("#"+high).next())
  {
  Obcur=jQuery("#"+high)
  OPrev=jQuery("#"+high).next()
  Obcur.slideUp()
  var temp;
  temp = Obcur.html()
  Obcur.html(OPrev.html())
  OPrev.html(temp)
  var sid;

  sid= Obcur.attr("id")
  Obcur.attr("id",OPrev.attr("id"));
  OPrev.attr("id",sid);
  Obcur.slideDown("slow")
  Obcur.append();
  OPrev.append();
  }
  }

