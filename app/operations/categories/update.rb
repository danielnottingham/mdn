# frozen_string_literal: true

module Categories
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :category, type: Category

    def call
      self.category = find_category

      fail!(error: :invalid_record) unless category.update(attributes)
    end

    private

    def find_category
      Categories::Find.result(id: id).category
    end
  end
end
