const Sequelize = require('sequelize')
const db = new Sequelize('postgres://localhost:5432/pug_example')

const Pug = db.define('pugs', {
  name: Sequelize.STRING,
  age: Sequelize.INTEGER,
  color: Sequelize.STRING
}, {
  timestamps: false
})
const Owner = db.define('owners', {
  name: Sequelize.STRING,
  age: Sequelize.INTEGER
}, {
  timestamps: false
})
const PugsOwners = db.define('pugs_owners', {
}, {
  timestamps: false
})
const Toy = db.define('toys', {
  name: Sequelize.STRING
}, {
  timestamps: false
})

Owner.belongsToMany(Pug, {through: PugsOwners})
Pug.belongsToMany(Owner, {through: PugsOwners})
Pug.hasMany(Toy)
Toy.belongsTo(Pug)

db.sync()
  .then(async () => {
    console.log('synced')
    const pugs = await Pug.findAll()
    console.log(pugs)
    db.close()
  })
  .catch(err => {
    console.log('oh noes')
    console.log(err)
    db.close()
  })