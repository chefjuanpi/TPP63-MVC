var Block = {
    Colors: [
      { Index: 0, Name: "Red" },
      { Index: 1, Name: "Green" },
      { Index: 2, Name: "Blue" },
      { Index: 3, Name: "Cyan" },
      { Index: 4, Name: "Orange" },
      { Index: 5, Name: "Purple" },
      { Index: 6, Name: "Yellow" },
    ],

    SetBlockSize: function (size) {
        Block.Size = size;
    },

    Block: function (posX, posY, color) {
        var img;
        img = document.createElement('img');
        img.className = 'gameBlock';
        img.src = 'Images/Game/' + color.Name + ' Block.png';

        this.X = posX;
        this.Y = posY;

        this.Color = color;
        this.Image = img;
        this.Visited = false; // Sert à vérifier si le block a été visité par un flood fill. 
    }
};

Block.Block.prototype.Draw = function (container) {
    this.Image.style.left = this.X * Block.Size + "px";
    this.Image.style.top = this.Y * Block.Size + "px";
    container.appendChild(this.Image);
};

Block.Block.prototype.Move = function (x, y) {
    this.X += x;
    this.Y += y;

    this.Image.style.left = this.X * Block.Size + "px";
    this.Image.style.top = this.Y * Block.Size + "px";
};