class FiguresController < ApplicationController
  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])

    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
  end

  get '/figures' do
    @figures=Figure.all

    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
  @figure=Figure.find(params[:id])
  @figure.update(params[:figure])


  unless params[:title][:name].empty?
    @figure.titles << Title.create(params[:title])
  end
  unless params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
  end
  @figure.save
    redirect to "/figures/#{@figure.id}"

  end

  get '/landmarks/new' do
    
    erb :'landmarks/new'
  end
  



end
