---
layout: default
title: Ysikymppiset
lang: fi
---

<div class="hero-bg"></div>  <!-- New hero background container -->
<div class="hero">
  <img src="/assets/YSIKYMPPISTEN MAINOS (2).png" alt="Syntymäpäiväjuhlat" class="party-title">
  <p>Valmistaudu pukuloistoon, hyvään seuraan, ja unohtumattomaan iltaan!</p>
  <a href="{{ site.rsvp_link }}" class="button">Ilmoittaudu täällä</a>
  <p><strong>Päivämäärä:</strong> {{ site.event.date }}</p>
  <p><strong>Sijainti:</strong> 
    <a href="{{ site.event.location_url }}"> {{ site.event.location }}</a></p>
</div>

<div class="invitation">
  <h2>Tapahtuman tiedot</h2>
  <p>Juhlapaikan ovet avautuvat klo 18.</p>
  <p>Tarjoamme alkumaljat ja cocktailaineksia, joita otetaan myös mielellään vastaan. Janoisemmille kuitenkin OPM! Lisäksi tarjolla on naposteltavaa ja synttärikakkua.</p>
  <p>Muistathan pukukoodin, joka määräytyy kutsuvan sankarin mukaan:</p>
  <ul>
    <li><strong>Raakel:</strong> Star Wars</li>
    <li><strong>Ilmari:</strong> Videopelit</li>
    <li><strong>Pauliina:</strong> Mikä tahansa oman nimen alkukirjaimella alkava</li>
  </ul>
  <p>Paikalla on valokuvaaja, joka ikuistaa pyynnöstänne ikoniset juhla-asut!</p>
  <p>Matka jatkuu puoliltaöin jatkoille lähistölle, jatkopaikka päivittyy myöhemmin!</p>
  <p>Pyydämme, että ette tuo onnittelukukkia, sillä ne eivät todennäköisesti selviä jatkoista.</p>
  <p><strong>Saapumisesta autolla:</strong> työväentalon yhteydessä rajatusti parkkitilaa, enemmän paikkoja radan toisella puolella, josta tunnelin kautta kulkuyhteys 70m</p>
</div>

<div class="rsvp">
  <h2>Ilmoittautuminen</h2>
  <p>Vahvista osallistumisesi klikkaamalla alla olevaa linkkiä:</p>
  <a href="{{ site.rsvp_link }}" class="button">Ilmoittaudu täällä</a>
</div>

{% if site.show_gallery %}

<div class="gallery">
  <h2>Gallery</h2>
  <p>After the party, visit our photo gallery here:</p>
  <a href="{{ site.gallery_link }}" class="button">View Gallery</a>
</div>
{% endif %}
