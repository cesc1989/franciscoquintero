---
layout: posts
title: Vite Build Acabando Recursos de VPS
category: software
---

En una aplicación Ruby on Rails que estoy haciendo decidí que el frontend de una parte sería en React. Para lograrlo me valdría de Inertia para tener en un mismo repo Rails y React (porque el frontend lo hará un amigo).

Inertia va muy bien en entorno de desarrollo. Funciona al pelo. Cero problemas. El lío vino cuando decidí poner la aplicación en un VPS.

Jamás pensé. Incluso estuve a punto de separar ambas apps y conectarlas mediante un API. Pero no me rendí y encontré la forma de lograr el build. Eso será en otro post. Ahora mismo quiero es dejar una captura que le hice al VPS cuando se ejecutaba el build tragon.

Esto pasa porque Node necesita muchos recursos cuando hace este tipo de procesos. Al ser el VPS el más sencillo de Lino, pues se quedaba colgado.

![recursos del VPS agotados por vite build](/assets/vite.build.prod.png)
