require 'rails_helper'

RSpec.describe StudioExerciseService, type: :service do
  let(:studio){ create(:studio) }
  let(:user) { create(:user, role: studio) }
  let(:exercise_1) { create(:exercise) }
  let(:exercise_2) { create(:exercise) }
  let(:exercise_3) { create(:exercise) }

  context "Studio add new exercises to its exercises list" do
    before { StudioExerciseService.new(studio).update_exercises([exercise_1.id])}
    it { expect(studio.exercises.pluck(:id)).to eq([exercise_1.id]) }
  end

  context "Studio remove old exercises from its exercises list" do
    before do
      studio_exercise_service = StudioExerciseService.new(studio)
      studio_exercise_service.update_exercises([exercise_1.id, exercise_2.id])
      studio_exercise_service.update_exercises([exercise_2.id])
    end
    it { expect(studio.exercises.pluck(:id)).to eq([exercise_2.id]) }
  end

  context "Studio add new exercises to and remove old exercises from its exercises list" do
    before do
      studio_exercise_service = StudioExerciseService.new(studio)
      studio_exercise_service.update_exercises([exercise_1.id, exercise_2.id])
      studio_exercise_service.update_exercises([exercise_2.id, exercise_3.id])
    end
    it { expect(studio.exercises.pluck(:id)).to eq([exercise_2.id, exercise_3.id]) }
  end
end
