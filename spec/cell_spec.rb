# frozen_string_literal: true

require "cell"

RSpec.describe Cell do
  describe "#tick" do
    context "with a living cell" do
      subject { Cell.new(1) }
      
      before do
        subject.neighbours_status = neighbours_status
      end
      
      context "when there are no living neighbours" do
        let(:neighbours_status) { [ 0, 0, 0, 0, 0, 0, 0, 0 ] }
        
        it "sets status to death" do
          subject.tick
          
          expect(subject.status).to eq(0)
        end
      end
      
      context "when there is one living neighbour" do
        let(:neighbours_status) { [ 0, 0, 0, 0, 0, 1, 0, 0 ] }
        
        it "sets status to death" do
          subject.tick
  
          expect(subject.status).to eq(0)
        end
      end
      
      context "when there are two living neighbours" do
        let(:neighbours_status) { [ 1, 0, 0, 0, 0, 1, 0, 0 ] }
        
        it "sets status to live" do
          subject.tick
  
          expect(subject.status).to eq(1)
        end
      end
      
      context "when there are three living neighbours" do
        let(:neighbours_status) { [ 1, 0, 1, 0, 0, 1, 0, 0 ] }
  
        it "sets status to live" do
          subject.tick
  
          expect(subject.status).to eq(1)
        end
      end
      
      context "when there are four living neighbours" do
        let(:neighbours_status) { [ 1, 1, 1, 0, 0, 1, 0, 0 ] }
        
        it "sets status to death" do
          subject.tick
          
          expect(subject.status).to eq(0)
        end
      end
      
      context "when there are more than four living neighbours" do
        let(:neighbours_status) { [ 1, 1, 1, 1, 0, 1, 0, 0 ] }

        it "sets status to death" do
          subject.tick

          expect(subject.status).to eq(0)
        end
      end
    end
    
    context "with a death cell" do
      subject { Cell.new(0) }

      before do
        subject.neighbours_status = neighbours_status
      end
      
      context "when there are three living neighbours" do
        let(:neighbours_status) { [ 1, 0, 1, 0, 0, 0, 0, 1 ] }
        
        it "sets status to live" do
          subject.tick
          
          expect(subject.status).to eq(1)
        end
      end
    end
  end
end