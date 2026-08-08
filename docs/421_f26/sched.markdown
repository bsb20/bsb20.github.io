---
layout: 421-wide
title: Schedule
permalink: /421_f26/sched
---
### Course Schedule

{% assign f = site.data.comp421.f26 %}

| Lecture | Date  | DoW | Topic                               |                         Project Info              | Textbook Chapters Covered | Misc. Readings             |
|---------|-------|-----|-------------------------------------|---------------------------------------------------|---------------------------|-----------------------------|
{% assign li = 0 -%}
{% for entry in f.timeline -%}
{%- if entry.date or entry.date_label or entry.topic -%}
{%- assign rd = entry.date -%}{%- assign n = entry.n -%}{%- assign base = entry.topic -%}{%- assign chapters = entry.chapters -%}{%- assign readings = entry.readings -%}{%- assign dlabel = entry.date_label -%}{%- assign dowov = entry.dow -%}
{%- else -%}
{%- assign rd = entry -%}{%- assign item = f.schedule[li] -%}{%- assign li = li | plus: 1 -%}{%- assign n = item.n -%}{%- assign base = item.topic -%}{%- assign chapters = item.chapters -%}{%- assign readings = item.readings -%}{%- assign dlabel = nil -%}{%- assign dowov = nil -%}
{%- endif -%}
{%- assign rowdate = rd | date: "%Y-%m-%d" -%}
{%- capture proj -%}{% for p in f.projects %}{% assign rel = p[1].release | date: "%Y-%m-%d" %}{% assign due = p[1].due | date: "%Y-%m-%d" %}{% if rowdate and rel == rowdate %}**[{{ p[0] | upcase }} Released](./{{ p[0] }})** {% endif %}{% if rowdate and due == rowdate %}{{ p[0] | upcase }} Due {% endif %}{% endfor %}{%- endcapture -%}
{%- capture topic -%}{% for ex in f.exams %}{% assign exd = ex[1].date | date: "%Y-%m-%d" %}{% if rowdate and exd == rowdate %}{{ ex[1].name }}{% endif %}{% endfor %}{{ base }}{%- endcapture -%}
{%- assign tt = topic | strip -%}{%- assign pp = proj | strip -%}
{%- if n or tt != "" or pp != "" or chapters or readings or dlabel -%}
| {{ n }} | {% if rd %}{{ rd | date: "%-m/%-d" }}{% elsif dlabel %}{{ dlabel }}{% endif %} | {% if dowov %}{{ dowov }}{% elsif rd %}{{ rd | date: "%a" | slice: 0 }}{% endif %} | {{ topic }} | {{ proj }} | {{ chapters }} | {{ readings }} |
{% endif -%}
{%- endfor %}
