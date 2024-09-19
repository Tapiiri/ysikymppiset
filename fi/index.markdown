---
layout: default
title: Syntymäpäiväjuhlat
lang: fi
---

<div class="hero-bg"></div>  <!-- New hero background container -->
<div class="hero">
  <img src="/assets/YSIKYMPPISTEN MAINOS (2).png" alt="Syntymäpäiväjuhlat" class="party-title">
  <p>Valmistaudu pukuloistoon, hyvään seuraan, ja unohtumattomaan iltaan!</p>
  <p><strong>Päivämäärä:</strong> {{ site.event.date }}</p>
  <p><strong>Sijainti:</strong> 
    <a href="{{ site.event.location_url }}"> {{ site.event.location }}</a></p>
</div>

<div class="invitation">
  <h2>Tapahtuman tiedot</h2>
  <p>Tule pukeutuneena johonkin seuraavista:</p>
  <ul>
    <li><strong>Raakel:</strong> Star Wars -hahmo</li>
    <li><strong>Ilmari:</strong> Videopelihahmo</li>
    <li><strong>Pauliina:</strong> Hahmo, jonka nimi alkaa samalla kirjaimella kuin oma nimesi</li>
  </ul>
</div>

<div class="rsvp">
  <h2>Ilmoittautuminen</h2>
  <p>Vahvista osallistumisesi <strong>7.10. mennessä!</strong></p>
  <p>Ilmoittaudu kutsujalta saamallasi linkillä.</p>
</div>

{% if site.show_gallery %}

<div class="gallery">
  <h2>Gallery</h2>
  <p>After the party, visit our photo gallery here:</p>
  <a href="{{ site.gallery_link }}" class="button">View Gallery</a>
</div>
{% endif %}
