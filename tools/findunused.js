const fs = require('fs');
const path = require('path');

let textures = [];
let maps = [];

function iterDir(dir, dest, filter) {
	let c = fs.readdirSync(dir);
	c.forEach((f, i, a) => {
		let p = path.resolve(dir, f);
		let stat = fs.lstatSync(p);
		
		if (stat.isDirectory()) {
			iterDir(p, dest, filter);
		} else {
			if (filter && !filter(p)) {
				return;
			}
			
			let name = path.basename(p, path.extname(p)).toLowerCase();
			console.log(name);
			
			dest.push({
				name: name,
				path: p,
				uses: 0
			});
		}
	});
}

iterDir('./textures/', textures, (p) => true);
iterDir('./maps/', maps, (p) => p.endsWith('.wad'));

function searchMap(p) {
	let str = fs.readFileSync(p);
	if (Buffer.isBuffer(str)) {
		str = str.toString();
	}
	
	str = str.toLowerCase();
	
	for (let i = 0; i < textures.length; i++) {
		let texture = textures[i];
		if (str.indexOf(texture.name) != -1) {
			textures[i].uses++;
		}
	}
}

maps.forEach((map) => {
	console.log(`search ${map.name}`);
	searchMap(map.path);
});

let unused = textures.filter((t) => t.uses < 1);
unused.forEach((t) => {
	fs.unlinkSync(t.path);
});