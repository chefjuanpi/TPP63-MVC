var G = { // G: Game
    BLOCK_SIZE: 20,
    CLUSTER_MIN_SIZE: 3,

    Difficulties: [
      { Index: 0, Name: "Facile", PieceCount: 3 },
      { Index: 1, Name: "Moyen", PieceCount: 4 },
      { Index: 2, Name: "Difficile", PieceCount: 5 },
      { Index: 3, Name: "Extreme", PieceCount: 6 }
    ],

    Sizes: [
      { Index: 0, Name: "Petit", Width: 20, Height: 20 },
      { Index: 1, Name: "Moyen", Width: 30, Height: 25 },
      { Index: 2, Name: "Grand", Width: 40, Height: 30 },
    ],

    Init: function (size, difficulty, container) {
        G.HasGameStarted = false;
    
        G.Score = 0;

        G.Width = size.Width;
        G.Height = size.Height;

        G.Size = size;
        G.Difficulty = difficulty;

        G.Container = container;

        G.Container.style.width = G.BLOCK_SIZE * G.width + 'px';
        G.Container.style.height = G.BLOCK_SIZE * G.Height + 'px';

        Block.SetBlockSize(G.BLOCK_SIZE);
        G.FillGrid();

        container.onclick = function (event) { G.OnClick(event) };
    },

    FillGrid: function () {
        G.Grid = new Array();
        var colorIndex;

        for (var x = 0; x < G.Width; x++) {
            G.Grid[x] = [];

            for (var y = 0; y < G.Height; y++) {
                colorIndex = Math.floor(Math.random() * G.Difficulty.PieceCount);

                G.Grid[x][y] = new Block.Block(x, y, Block.Colors[colorIndex]);

                G.Grid[x][y].Draw(G.Container);
            }
        }
    },

    CleanUpImgs: function() {
        for (var x = 0; x < G.Width; x++) {
            for (var y = 0; y < G.Height; y++) {
                if (G.Grid[x][y] !== undefined)
                    TryRemove(G.Grid[x][y].Image);
            }
        }
    },

    GetSameColorCluster: function (x, y, colorIndex, cluster) {
        var block = G.Grid[x][y];

        if (block === undefined || block.Visited || block.Color.Index !== colorIndex)
            return cluster;

        block.Visited = true;

        cluster.push(block);

        if (x < G.Width - 1)  cluster = G.GetSameColorCluster(x + 1, y, colorIndex, cluster);
        if (x > 0)            cluster = G.GetSameColorCluster(x - 1, y, colorIndex, cluster);
        if (y < G.Height - 1) cluster = G.GetSameColorCluster(x, y + 1, colorIndex, cluster);
        if (y > 0)            cluster = G.GetSameColorCluster(x, y - 1, colorIndex, cluster);

        return cluster;
    },

    UpdateScore: function (clusterSize) {
        G.Score += clusterSize * clusterSize;
        G.ScoreUpdated(clusterSize, G.Score);
    },

    DestroyBlocks: function (blocks) {
        blocks.forEach(function (b) {
            Remove(b.Image);
            G.Grid[b.X][b.Y] = undefined;
        });
    },

    MakeBlocksFall: function () {
        var dropSize;

        for (var x = 0; x < G.Width; x++) {
            dropSize = 0;

            for (var y = G.Height - 1; y >= 0; y--) {
                if (G.Grid[x][y] === undefined)
                    dropSize++;
                else if (dropSize > 0) {
                    G.Grid[x][y].Move(0, dropSize);
                    G.Grid[x][y + dropSize] = G.Grid[x][y];
                }
            }

            for (var y = dropSize - 1; y >= 0; y--) {
                G.Grid[x][y] = undefined;
            }
        }
    },

    CleanUpFloodFill: function () {
        for (var x = 0; x < G.Width; x++) {
            for (var y = 0; y < G.Height; y++) {
                if (G.Grid[x][y] !== undefined)
                    G.Grid[x][y].Visited = false;
            }
        }
    },

    OnClick: function (e) {
        if (!G.HasGameStarted) {
            G.GameStarted();
            G.HasGameStarted = true;
        }
        
        var containerAbsPos = $(G.Container).offset();

        var scrollY = window.pageYOffset || document.documentElement.scrollTop
        var scrollX = window.pageXOffset || document.documentElement.scrollLeft

        var x = Math.floor((e.x - containerAbsPos.left + scrollX) / G.BLOCK_SIZE);
        var y = Math.floor((e.y - containerAbsPos.top + scrollY) / G.BLOCK_SIZE);

        var block = G.Grid[x][y];

        if (block === undefined)
            return;

        var cluster = G.GetSameColorCluster(x, y, block.Color.Index, new Array());

        if (cluster.length >= G.CLUSTER_MIN_SIZE) {
            G.UpdateScore(cluster.length);
            G.DestroyBlocks(cluster);
            G.MakeBlocksFall();
        }

        G.CleanUpFloodFill();
    },

    ScoreUpdated: function (clusterSize, newScore) { }      ,
    GameStarted: function () { }
};