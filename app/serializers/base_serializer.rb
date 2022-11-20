# frozen_string_literal: true

class BaseSerializer < Blueprinter::Base
  identifier :id

  field :created_at
  field :updated_at

  # Исключает лишние поля для отображения
  view :excludes_base do
    excludes :errors, :created_at, :updated_at
  end
end
