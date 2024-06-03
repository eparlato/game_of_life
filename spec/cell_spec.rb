# frozen_string_literal: true

require "cell"

RSpec.describe Cell do
  describe "#tick" do
    context "with a living cell" do
      subject { Cell.new(Cell::ALIVE) }
      
      before do
        subject.neighbours_statuses = neighbours_statuses
      end
      
      context "when there are no living neighbours" do
        let(:neighbours_statuses) { [Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD ] }
        
        it "sets status to dead" do
          subject.tick
          
          expect(subject.status).to eq(Cell::DEAD)
        end
      end
      
      context "when there is one living neighbour" do
        let(:neighbours_statuses) { [Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD ] }
        
        it "sets status to dead" do
          subject.tick
  
          expect(subject.status).to eq(Cell::DEAD)
        end
      end
      
      context "when there are two living neighbours" do
        let(:neighbours_statuses) { [Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD ] }
        
        it "sets status to alive" do
          subject.tick
  
          expect(subject.status).to eq(Cell::ALIVE)
        end
      end
      
      context "when there are three living neighbours" do
        let(:neighbours_statuses) { [Cell::ALIVE, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD ] }
  
        it "sets status to alive" do
          subject.tick
  
          expect(subject.status).to eq(Cell::ALIVE)
        end
      end
      
      context "when there are four living neighbours" do
        let(:neighbours_statuses) { [Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD ] }
        
        it "sets status to dead" do
          subject.tick
          
          expect(subject.status).to eq(Cell::DEAD)
        end
      end
      
      context "when there are more than four living neighbours" do
        let(:neighbours_statuses) { [Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD ] }

        it "sets status to dead" do
          subject.tick

          expect(subject.status).to eq(Cell::DEAD)
        end
      end
    end
    
    context "with a dead cell" do
      subject { Cell.new(Cell::DEAD) }

      before do
        subject.neighbours_statuses = neighbours_statuses
      end
      
      context "when there are no living neighbours" do
        let(:neighbours_statuses) { [Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD ] }
        
        it "sets status to dead" do
          subject.tick
          
          expect(subject.status).to eq(Cell::DEAD)
        end
      end
      
      context "when there is one living neighbours" do
        let(:neighbours_statuses) { [Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::ALIVE ] }
        
        it "sets status to dead" do
          subject.tick

          expect(subject.status).to eq(Cell::DEAD)
        end
      end
      
      context "when there are two living neighbours" do
        let(:neighbours_statuses) { [Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::DEAD ] }
        
        it "set status to dead" do
          subject.tick
          
          expect(subject.status).to eq(Cell::DEAD)
        end
      end
      
      context "when there are three living neighbours" do
        let(:neighbours_statuses) { [Cell::ALIVE, Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::ALIVE ] }
        
        it "sets status to alive" do
          subject.tick
          
          expect(subject.status).to eq(Cell::ALIVE)
        end
      end
      
      context "when there are four living neighbours" do
        let(:neighbours_statuses) { [Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::DEAD, Cell::ALIVE, Cell::DEAD ] }

        it "set status to dead" do
          subject.tick

          expect(subject.status).to eq(Cell::DEAD)
        end
      end
      
      context "when there are more than four living neighbours" do
        let(:neighbours_statuses) { [Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE ] }

        it "set status to dead" do
          subject.tick

          expect(subject.status).to eq(Cell::DEAD)
        end
      end
    end
  end
end