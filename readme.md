# Grid Helper

A (currently rails-only) dsl for css grids, just because.

grid helper can be used in erb templates.

```
<%= row class: 'collapse field' do %>
  <%= three_columns f.label :name, class: 'prefix' %>
  <%= nine_columns f.textfield :name %>
<% end %>
```

this renders 

```
<div class="row collapse field">
  <div class="large-3 small-3 columns">
    <label class="prefix" for="user_name">name</label>
  </div>
  <div class="large-9 small-9 columns">
    <input type="text" id="user_name" name="user[name]" />
  </div>
</div>
```

grid helper can also be used in helpers by using a block parameter

```
row class: 'collapse field' do |o|
  o << three_columns(f.label :name, class: 'prefix')
  o << nine_columns(f.textfield :name)
end
```

