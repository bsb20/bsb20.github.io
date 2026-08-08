---
layout: 421 
title: Projects
permalink: /421_f26/proj
---

{%- assign proj = site.data.comp421.f26.projects -%}
{%- assign dt = site.data.comp421.f26.due_time -%}

| # | Project                   | Release Date | Due Date             |
|---|---------------------------|--------------|----------------------|
{% for p in proj -%}
{%- if p[1].name -%}
| {{ p[0] | remove: "p" }} | **[{{ p[1].name }}](./{{ p[0] }})** | {{ p[1].release | date: "%-m/%-d/%y" }} | {{ p[1].due | date: "%-m/%-d/%y" }} @ {{ dt }} |
{% endif -%}
{%- endfor %}
