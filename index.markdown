---
layout: default
title: Birthday Party
---

<div class="hero">
  <h1>Welcome to the Birthday Party!</h1>
  <p>Get ready for an unforgettable celebration filled with fun, games, and surprises!</p>
  <p><strong>Date:</strong> 19.10</p>
  <p><strong>Location:</strong> Tapaniilan Työväentalo, Sompiontie 4</p>
</div>

<div class="invitation">
  <h2>Event Details</h2>
  <p>Come dressed as one of the following:</p>
  <ul>
    <li><strong>Raakel:</strong> Star Wars characters</li>
    <li><strong>Ilmari:</strong> Video Game characters</li>
    <li><strong>Pauliina:</strong> A character starting with the same letter as your name</li>
  </ul>
</div>

<div class="rsvp">
  <h2>RSVP</h2>
  <p>Please confirm your attendance by clicking the link below:</p>
  <a href="{{ site.rsvp_link }}" class="button">RSVP Here</a>
</div>

{% if site.show_gallery %}

<div class="gallery">
  <h2>Gallery</h2>
  <p>After the party, visit our photo gallery here:</p>
  <a href="{{ site.gallery_link }}" class="button">View Gallery</a>
</div>
{% endif %}
