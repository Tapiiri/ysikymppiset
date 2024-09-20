---
layout: default
title: Ysikymppiset
lang: en
---

<div class="hero-bg"></div>  <!-- New hero background container -->
<div class="hero">
  <img src="/assets/YSIKYMPPISTEN MAINOS (2).png" alt="Birthday Party Title" class="party-title">
  <p>Get ready for amazing costumes, wonderful company, and an unforgettable night of celebration!</p>
  <a href="{{ site.rsvp_link }}" class="button">RSVP Here</a>
  <p><strong>Date:</strong> {{ site.event.date }}</p>
  <p><strong>Location:</strong> <a href="{{ site.event.location_url }}"> {{ site.event.location }}</a></p>
</div>

<div class="invitation">
  <h2>Event Details</h2>
  <p>The venue doors open at 6:00 PM.</p>
  <p>We will provide welcome drinks and cocktail ingredients, and you're welcome to bring your own! However, for those with bigger thirsts, BYOB! Snacks and birthday cake will also be available.</p>
  <p>Remember the dress code, which is based on the host:</p>
  <ul>
    <li><strong>Raakel:</strong> Star Wars characters</li>
    <li><strong>Ilmari:</strong> Video Game characters</li>
    <li><strong>Pauliina:</strong> Any character starting with the same letter as your name</li>
  </ul>
  <p>A photographer will be present to capture your iconic party outfits!</p>
  <p>The journey continues at midnight, as we move to an after-party nearby. The after-party location will be updated later!</p>
  <p>We kindly ask you not to bring congratulatory flowers, as they are unlikely to survive the after-party.</p>
  <p><strong>Arriving by car:</strong> Limited parking is available at the venue. Additional parking can be found on the other side of the tracks, with a 70m walk through the tunnel.</p>
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
