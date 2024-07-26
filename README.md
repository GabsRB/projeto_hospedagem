# Projeto Host para voluntarios e mochileiros

* Alteração no formulario de login:
<div class="form-container">
    <h1 class="text-center">Login</h1>
    <%= form_with(url: login_path, scope: :session, local: true) do |form| %>
      <div class="form-group, text-center">
        <%= form.label :email %>
        <%= form.text_field :email %>
      </div>
      <div class="form-group, text-center">
        <%= form.label :password %>
        <%= form.password_field :password %>
      </div>
      <div class="text-center">
        <%= form.submit "Entrar", class: 'btn btn-primary' %>
      </div>
    <% end %>
  </div>
