# frozen_string_literal: true

require "cell"

RSpec.describe Cell do
  describe "#tick" do
    context "with a living cell" do
      subject { Cell.new(:alive) }
      
      before do
        subject.neighbours_status = neighbours_status
      end
      
      context "when there are no living neighbours" do
        let(:neighbours_status) { [ :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ] }
        
        it "sets status to dead" do
          subject.tick
          
          expect(subject.status).to eq(:dead)
        end
      end
      
      context "when there is one living neighbour" do
        let(:neighbours_status) { [ :dead, :dead, :dead, :dead, :dead, :alive, :dead, :dead ] }
        
        it "sets status to dead" do
          subject.tick
  
          expect(subject.status).to eq(:dead)
        end
      end
      
      context "when there are two living neighbours" do
        let(:neighbours_status) { [ :alive, :dead, :dead, :dead, :dead, :alive, :dead, :dead ] }
        
        it "sets status to alive" do
          subject.tick
  
          expect(subject.status).to eq(:alive)
        end
      end
      
      context "when there are three living neighbours" do
        let(:neighbours_status) { [ :alive, :dead, :alive, :dead, :dead, :alive, :dead, :dead ] }
  
        it "sets status to alive" do
          subject.tick
  
          expect(subject.status).to eq(:alive)
        end
      end
      
      context "when there are four living neighbours" do
        let(:neighbours_status) { [ :alive, :alive, :alive, :dead, :dead, :alive, :dead, :dead ] }
        
        it "sets status to dead" do
          subject.tick
          
          expect(subject.status).to eq(:dead)
        end
      end
      
      context "when there are more than four living neighbours" do
        let(:neighbours_status) { [ :alive, :alive, :alive, :alive, :dead, :alive, :dead, :dead ] }

        it "sets status to dead" do
          subject.tick

          expect(subject.status).to eq(:dead)
        end
      end
    end
    
    context "with a dead cell" do
      subject { Cell.new(:dead) }

      before do
        subject.neighbours_status = neighbours_status
      end
      
      context "when there are no living neighbours" do
        let(:neighbours_status) { [ :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ] }
        
        it "sets status to dead" do
          subject.tick
          
          expect(subject.status).to eq(:dead)
        end
      end
      
      context "when there is one living neighbours" do
        let(:neighbours_status) { [ :dead, :dead, :dead, :dead, :dead, :dead, :dead, :alive ] }
        
        it "sets status to dead" do
          subject.tick

          expect(subject.status).to eq(:dead)
        end
      end
      
      context "when there are two living neighbours" do
        let(:neighbours_status) { [ :dead, :dead, :dead, :alive, :dead, :dead, :alive, :dead ] }
        
        it "set status to dead" do
          subject.tick
          
          expect(subject.status).to eq(:dead)
        end
      end
      
      context "when there are three living neighbours" do
        let(:neighbours_status) { [ :alive, :dead, :alive, :dead, :dead, :dead, :dead, :alive ] }
        
        it "sets status to alive" do
          subject.tick
          
          expect(subject.status).to eq(:alive)
        end
      end
      
      context "when there are four living neighbours" do
        let(:neighbours_status) { [ :dead, :dead, :alive, :alive, :alive, :dead, :alive, :dead ] }

        it "set status to dead" do
          subject.tick

          expect(subject.status).to eq(:dead)
        end
      end
      
      context "when there are more than four living neighbours" do
        let(:neighbours_status) { [ :alive, :alive, :alive, :alive, :alive, :alive, :alive, :alive ] }

        it "set status to dead" do
          subject.tick

          expect(subject.status).to eq(:dead)
        end
      end
    end
  end
end