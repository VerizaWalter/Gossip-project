class GossipController < ApplicationController
  def index

   @gossips = Gossipp.all
  	
  end
  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossipp.find(params[:id])

  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossipp.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    user =User.find(2)
    @gossip = Gossipp.new(title:params[:title],content:params[:content],user_id:user.id)
    if 
      @gossip.save
      redirect_to '/gossip'
      
    else
      render :new
      
    end

    @gossip = Gossipp.create[:id]
  @gossip = User.find_by(id: session[:user_id])
    if @gossip
    flash[:success] = "Potin bien créé !"
    redirect_to root_path
   
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossipp.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    user = User.find(2)
    @gossip = Gossipp.find(params[:id])
    @gossip.update(title: params[:title], content: params[:content])
    redirect_to '/gossip'
 end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossip_path
  end
end