const pool = require("../../../db");
const queries = require("../queries/queries");

const getPostgres = (req, res) => {
  const { start, end, orderBy } = req.query;
  let query = queries.getPostgres;

  if (start && end) {
      query += ` WHERE j01 BETWEEN ${start} AND ${end}`;
  }

  if (orderBy) {
      query += ` ORDER BY j01 ${orderBy.toUpperCase()}`;
  }

  pool.query(query, (error, results) => {
      if (error) {
          console.error('Error fetching data:', error);
          res.status(500).json({ error: 'Internal server error' });
          return;
      }

      const rowCount = results.rows.length; 
      res.set({
          'Access-Control-Expose-Headers': 'Content-Range',
          'Content-Range': `X-Total-Count: ${rowCount}`,
      });
      res.status(200).json(results.rows);
  });
};

const getPostgresById = (req, res) => {
  const id = parseInt(req.params.id);
  pool.query(queries.getPostgresById, [id], (error, results) => {
    if (error) throw error;
    res.status(200).json(results.rows);
  });
};

const addPostgres = (req, res) => {
  const {
    j01,
    j03,
    j04,
    j1impiva,
    j1rif_offer,
    j1rif_client,
    j1dat,
    j1titol,
    j1note,
    j1fat_1,
    j1fat_1_rif,
    j1fat_2,
    j1fat_2_rif,
    j1fat_3,
    j1fat_3_rif,
    j1tot_fat,
    sel,
    link_ordine,
    j1_avanz,
    j1_av_data,
  } = req.body;

  pool.query(
    queries.addPostgres,
    [
      j01,
      j03,
      j04,
      j1impiva,
      j1rif_offer,
      j1rif_client,
      j1dat,
      j1titol,
      j1note,
      j1fat_1,
      j1fat_1_rif,
      j1fat_2,
      j1fat_2_rif,
      j1fat_3,
      j1fat_3_rif,
      j1tot_fat,
      sel,
      link_ordine,
      j1_avanz,
      j1_av_data,
    ],
    (error, results) => {
      if (error) throw error;
      res.status(201).send("New data for table j01 created!");
    }
  );
};

const removePostgres = (req, res) => {
  const id = parseInt(req.params.id);
  if (isNaN(id)) {
    res.status(400).send("Invalid ID");
    return;
  }

  pool.query(queries.getPostgresById, [id], (error, results) => {
    const noPostgresFound = !results.rows.length;
    if (noPostgresFound) {
      res.send("This doesn't exist in the database, could not remove");
      return;
    }

    pool.query(queries.removePostgres, [id], (error, results) => {
        if(error) throw error
        res.status(200).send("J01 data removed successfully")
    })
  });
};


const updatePostgres = (req, res) => {
    const id = parseInt(req.params.id)
    const { j03,j04,j1impiva,j1rif_offer,j1rif_client,j1dat,j1titol,j1note,j1fat_1,j1fat_1_rif,j1fat_2,j1fat_2_rif,j1fat_3,j1fat_3_rif,j1tot_fat,sel,link_ordine,j1_avanz,j1_av_data} = req.body

    pool.query(queries.getPostgresById, [id], (error, results) => {
      const noPostgresFound = !results.rows.length
      if(noPostgresFound) {
        res.send("The data doesn't exits in the database")
      }

      pool.query(queries.updatePostgres, [ j03,j04,j1impiva,j1rif_offer,j1rif_client,j1dat,j1titol,j1note,j1fat_1,j1fat_1_rif,j1fat_2,j1fat_2_rif,j1fat_3,j1fat_3_rif,j1tot_fat,sel,link_ordine,j1_avanz,j1_av_data, id], (error,results) => {
        if(error) throw error
        res.status(200).send("J01 data updated successfully")
      })
    })
}

module.exports = {
  getPostgres,
  getPostgresById,
  addPostgres,
  removePostgres,
  updatePostgres
};
