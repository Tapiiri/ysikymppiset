---
layout: default
title: Birthday Party
lang: en
---

<div class="hero-bg"></div>  <!-- New hero background container -->
<div class="hero">
  <img src="/assets/YSIKYMPPISTEN MAINOS (2).png" alt="Birthday Party Title" class="party-title">
  <p>Get ready for amazing costumes, wonderful company, and an unforgettable night of celebration!</p>
  <p><strong>Date:</strong> {{ site.event.date }}</p>
  <p><strong>Location:</strong> <a href="{{ site.event.location_url }}"> {{ site.event.location }}</a></p>
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
  <p>Please confirm your attendance by <strong>7.10.!</strong></p>
  <p>Sign up by using the link sent to you by your inviter.</p>
</div>

{% if site.show_gallery %}

<div class="gallery">
  <h2>Gallery</h2>
  <p>After the party, visit our photo gallery here:</p>
  <a href="{{ site.gallery_link }}" class="button">View Gallery</a>
</div>
{% endif %}
